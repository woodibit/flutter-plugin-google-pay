import 'dart:math';
import 'package:flutter/material.dart';
import 'widgets/chat_bubble.dart';

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<String> _aiResponses = [
    "The spirits whisper your fortune...",
    "A pinch of nightshade, a dash of newt's eye, your request is clear!",
    "From the cauldron's depths, an answer bubbles forth...",
    "By the light of the full moon, your query is revealed!",
    "The runes have spoken! And they say...",
    "Hocus pocus, focus, your message comes through the smoke!"
  ];

  @override
  void initState() {
    super.initState();
    _messages.add(ChatMessage(
        text: "Greetings! What brings you to my humble abode?",
        isUser: false));
  }

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty) return;

    _textController.clear();
    setState(() {
      _messages.add(ChatMessage(text: text, isUser: true));
    });
    _scrollToBottom();

    // Simulate AI thinking time
    Future.delayed(const Duration(milliseconds: 500), () {
      final aiResponse = _getAiResponse();
      setState(() {
        _messages.add(ChatMessage(text: aiResponse, isUser: false));
      });
      _scrollToBottom();
    });
  }

  String _getAiResponse() {
    final random = Random();
    return _aiResponses[random.nextInt(_aiResponses.length)];
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(8.0),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              final message = _messages[index];
              return ChatBubble(
                message: message.text,
                isUserMessage: message.isUser,
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -1),
                blurRadius: 1,
                color: Colors.grey.withOpacity(0.2),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: 'Type a message...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(8.0),
                  ),
                  onSubmitted: _handleSubmitted,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
