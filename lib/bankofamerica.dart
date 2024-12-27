import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  bool isTyping = false; // Track if user is typing
  final TextEditingController _controller = TextEditingController();

  void _onTextChanged(String value) {
    setState(() {
      isTyping = value.isNotEmpty; // Update typing status
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(
            122, 3, 145, 27), // Updated AppBar background color
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CardScreen1()),
            );
          },
        ),
        title: const Text(
          'Bank of America',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 250, 248, 248),
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: const [
                  MessageBubble(
                    message:
                        'Report card ending #7000 at Mechani in NJ for \$1,200?\nReply YES or NO',
                    time: '8/10/2018',
                    isUser: false,
                  ),
                  SizedBox(height: 12),
                  MessageBubble(
                    message: 'Yes',
                    isUser: true,
                  ),
                  SizedBox(height: 12),
                  MessageBubble(
                    message:
                        'Bank of America : 256486 is your authorization code which expires in 10 minutes. If you didn\'t request the code.\nCall: 18009898 for assistance',
                    isUser: false,
                  ),
                  SizedBox(height: 12),
                  MessageBubble(
                    message: 'Thanks!',
                    isUser: true,
                  ),
                ],
              ),
            ),
            if (isTyping) // Conditionally show typing indicator
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Typing...',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border(
                  top: BorderSide(
                    color: Colors.grey.shade900,
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: _controller,
                        onChanged: _onTextChanged, // Detect typing
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Message',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      if (_controller.text.isNotEmpty) {
                        // Add logic to send the message
                        setState(() {
                          isTyping = false; // Reset typing status
                          _controller.clear(); // Clear text field
                        });
                      }
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.black, // Changed to black background
                        borderRadius: BorderRadius.circular(17.5),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white, // Text and icon remain white
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String message;
  final String? time;
  final bool isUser;

  const MessageBubble({
    super.key,
    required this.message,
    this.time,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isUser ? Colors.green : Colors.grey[900],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isUser ? Colors.black : Colors.white,
              fontSize: 15,
            ),
          ),
        ),
        if (time != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              time!,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}

// Dummy screen for CardScreen1
class CardScreen1 extends StatelessWidget {
  const CardScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Screen 1'),
      ),
      body: const Center(
        child: Text('Card Screen 1 Content'),
      ),
    );
  }
}
