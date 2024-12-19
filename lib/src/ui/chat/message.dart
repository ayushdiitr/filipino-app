import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'dart:convert';
import 'package:testapp/components/chat/chat_header.dart';
import 'package:testapp/components/chat/chatbox.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final String conversationId;
  final String currentUserId;
  final String recipientUserId;

  ChatScreen({
    required this.conversationId,
    required this.currentUserId,
    required this.recipientUserId,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late WebSocketChannel _channel;
  final List<Map<String, String>> _messages = [];
  final TextEditingController _messageController = TextEditingController();

  String formatTimestamp(String timestamp) {
    // Parse the ISO 8601 timestamp
    DateTime dateTime = DateTime.parse(timestamp);

    // Format the date and time for display
    String formattedTime =
        DateFormat('hh:mm a').format(dateTime); // e.g., 04:42 PM
    String formattedDate =
        DateFormat('MMM d, yyyy').format(dateTime); // e.g., Dec 18, 2024

    // Check if the message is from today
    DateTime now = DateTime.now();
    if (dateTime.day == now.day &&
        dateTime.month == now.month &&
        dateTime.year == now.year) {
      return formattedTime; // Show only the time if the message is from today
    }

    return '$formattedDate, $formattedTime'; // Show date and time for older messages
  }

  @override
  void initState() {
    super.initState();

    // Initialize WebSocket channel
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://10.0.2.2:8000/ws/chat/${widget.conversationId}'),
    );

    // Listen for incoming messages
    _channel.stream.listen(
      (event) {
        final data = jsonDecode(event);
        setState(() {
          _messages.add({
            'sender_id': data['sender_id'],
            'content': data['content'],
            'timestamp': data['timestamp'],
          });
        });
      },
      onError: (error) {
        print('WebSocket Error: $error');
      },
      onDone: () {
        print('WebSocket connection closed.');
      },
    );
  }

  @override
  void dispose() {
    _channel.sink.close(status.goingAway); // Close WebSocket connection
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isNotEmpty) {
      final jsonMessage = jsonEncode({
        'sender_id': widget.currentUserId,
        'content': message,
        'recipient_id': widget.recipientUserId,
      });

      _channel.sink.add(jsonMessage);

      setState(() {
        _messages.add({
          'sender_id': widget.currentUserId,
          'content': message,
          'timestamp': DateTime.now().toString(),
        });
      });

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ChatHeader is fixe
          SizedBox(height: 24),
          ChatHeader(),

          // The rest of the screen is scrollable
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MessageScreen(
                      messages: _messages, currentUserId: widget.currentUserId),
                ],
              ),
            ),
          ),

          ChatBox(
              sendMessage: _sendMessage, messageController: _messageController),
        ],
      ),
    );
  }
}

// MessageScreen Component (Dynamic)
class MessageScreen extends StatelessWidget {
  final List<Map<String, String>> messages;
  final String currentUserId;

  MessageScreen({required this.messages, required this.currentUserId});

  String formatTimestamp(String timestamp) {
    // Parse the ISO 8601 timestamp
    DateTime dateTime = DateTime.parse(timestamp);

    // Format the date and time for display
    String formattedTime =
        DateFormat('hh:mm a').format(dateTime); // e.g., 04:42 PM
    String formattedDate =
        DateFormat('MMM d, yyyy').format(dateTime); // e.g., Dec 18, 2024

    // Check if the message is from today
    DateTime now = DateTime.now();
    if (dateTime.day == now.day &&
        dateTime.month == now.month &&
        dateTime.year == now.year) {
      return formattedTime; // Show only the time if the message is from today
    }

    return '$formattedDate, $formattedTime'; // Show date and time for older messages
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: messages.map((message) {
          final isSentByCurrentUser = message['sender_id'] == currentUserId;
          final formattedTS = formatTimestamp(message['timestamp'] ?? '');
          return Column(
            crossAxisAlignment: isSentByCurrentUser
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Container(
                width: 311,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color:
                      isSentByCurrentUser ? Colors.blue[100] : Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(16),
                    bottomRight: isSentByCurrentUser
                        ? Radius.circular(4)
                        : Radius.circular(16),
                    bottomLeft: isSentByCurrentUser
                        ? Radius.circular(16)
                        : Radius.circular(4),
                  ),
                ),
                child: Text(
                  message['content'] ?? '',
                  style: TextStyle(
                    fontFamily: 'NoirPro',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.02,
                    color: Colors.black.withOpacity(0.6),
                    height: 1.5,
                  ),
                ),
              ),
              // Timestamp placeholder (for now)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  formattedTS,
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.3),
                    letterSpacing: 0.02,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          );
        }).toList(),
      ),
    );
  }
}
