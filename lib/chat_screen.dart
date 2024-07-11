import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'config.dart';
import 'home_page.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatUser user = ChatUser(id: '1', firstName: 'Hamza', lastName: 'DAMIRI');
  final ChatUser bot = ChatUser(id: '2', firstName: 'Bot');
  final List<ChatMessage> messages = [];
  final OpenAI openAI = OpenAI.instance.build(token: Config.apiKey);

  Future<void> _sendMessage(ChatMessage message) async {
    setState(() {
      messages.insert(0,ChatMessage(
          user: user,
          text: message.text,
          createdAt: DateTime.now())
      );
    });

    final request = CompleteText(
      prompt: message.text,
      model: Gpt3TurboInstruct(),
      maxTokens: 150,
    );

    try {
      final response = await openAI.onCompletion(request: request);
      final botResponse = response?.choices.first.text.trim();

      if (botResponse != null) {
        setState(() {
          messages.insert(0,ChatMessage(
            user: bot,
            text: botResponse,
            createdAt: DateTime.now(),
          ));
        });
      } else {
        setState(() {
          messages.insert(0,ChatMessage(
            user: bot,
            text: 'Failed to load response',
            createdAt: DateTime.now(),
          ));
        });
      }
    } catch (e) {
      setState(() {
        messages.insert(0,ChatMessage(
          user: bot,
          text: 'Error: $e',
          createdAt: DateTime.now(),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatGPT ChatBot'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home_filled),
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
        ],
      ),
      body: DashChat(
        currentUser: user,
        onSend: _sendMessage,
        messages: messages,
        messageOptions: const MessageOptions(
          showCurrentUserAvatar: true,
          showTime: true,
          containerColor: Colors.white30,
          textColor: Colors.white,
          currentUserTextColor: Colors.white,
          currentUserContainerColor: Color(0xFF880E4F)
        ),
        inputOptions: InputOptions(
          sendOnEnter: true,
          alwaysShowSend: false,
          sendButtonBuilder: defaultSendButton(
            color: Colors.white70,
            icon: Icons.send_rounded,
          ) ,
          inputDecoration: InputDecoration(
            prefixIcon: const Icon(Icons.blur_on_sharp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintMaxLines: 6,
            hintText: 'Enter your message',
          ),
        ),
      ),
    );
  }
}