import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: const Center(
        child: Stack(
          children: [
            Center(
              child: SpinKitDancingSquare(
                color: Colors.deepPurple,
                size: 200.0,
                duration: Duration(seconds: 3),
              ),
            ),
            /*SpinKitRipple(
              color: Colors.grey,
              size: 200.0,
            ),*/
            Center(
              child: Text(
                'ChatGPT ChatBot',
                style: TextStyle(fontSize: 24.0, fontFamily: 'FF_Meta'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50.0,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const ChatScreen()));
            },
            child: const Text('Chat Now'),
          ),
        ),
      ),
    );
  }
}
