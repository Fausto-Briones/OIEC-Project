import 'package:flutter/material.dart';
import 'package:oiec_app/utilities/colorsController.dart';
import '../services/navigator.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {

  final Enrouter router = Enrouter.instance;

  final List<Map<String, dynamic>> _messages = [
    {'text': 'Hello! Jhon abraham', 'isSentByMe': true, 'time': '09:25 AM'},
    {
      'text': 'Hello! Nazrul How are you?',
      'isSentByMe': false,
      'time': '09:25 AM'
    },
    {'text': 'You did your job well!', 'isSentByMe': true, 'time': '09:25 AM'},
    {
      'text': 'Have a great working week!!',
      'isSentByMe': false,
      'time': '08:25 AM'
    },
    {'text': 'Hope you like it', 'isSentByMe': false, 'time': '08:25 AM'},
  ];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _controller.text,
          'isSentByMe': true,
          'time': TimeOfDay.now().format(context),
        });
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Entrenador 1'),
            Text('Active now', style: TextStyle(fontSize: 14)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            router.navigateToChatScreen(context);
          },
        ),
        backgroundColor: HexColor('#141927'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessage(message);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
      backgroundColor: HexColor('#141927'),
    );
  }

  Widget _buildMessage(Map<String, dynamic> message) {
    final isSentByMe = message['isSentByMe'];
    final alignment =
        isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final color = isSentByMe ? Colors.blue : Colors.white;
    final textColor = isSentByMe ? Colors.white : Colors.black;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          if (!isSentByMe)
            const Row(
              children: [
                CircleAvatar(
                  child: Text('E1'),
                ),
                SizedBox(width: 5),
                Text('Entrenador 1'),
              ],
            ),
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 5),
            child: Column(
              crossAxisAlignment: alignment,
              children: [
                Text(message['text'], style: TextStyle(color: textColor)),
                const SizedBox(height: 5),
                Text(
                  message['time'],
                  style: TextStyle(color: textColor, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.mic),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Escribe tu mensaje',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _sendMessage,
          ),
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
