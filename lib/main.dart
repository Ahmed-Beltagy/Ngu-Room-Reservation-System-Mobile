import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:ngu_room_reservation/Rooms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NGU x Room Reservation System',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'N.G.U.'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool goodToGo = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffab9d),
        title: Text(widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            )),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          const Text("Room Reservation",
              style: TextStyle(
                  color: Color(0xFFffab9d),
                  fontSize: 40,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 200,
          ),
          Center(
            child: AnimatedButton(
              height: 90,
              width: 300,
              text: 'Manage Rooms.',
              isReverse: true,
              selectedTextColor: Colors.black,
              transitionType: TransitionType.LEFT_TO_RIGHT,
              backgroundColor: const Color(0xFFffab9d),
              borderColor: const Color(0xFFffab9d),
              borderRadius: 50,
              borderWidth: 2,
              onPress: () {
                if (!goodToGo) {
                  return;
                }
                if (goodToGo) {
                  debugPrint("Going to the moon!");
                } // do your thing
                goodToGo = false;
                Future.delayed(const Duration(milliseconds: 1000), () {
                  goodToGo = true;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RoomManagmnet()));
                });
              },
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Center(
            child: AnimatedButton(
              height: 90,
              width: 300,
              text: 'Manage Buildings.',
              isReverse: true,
              selectedTextColor: Colors.black,
              transitionType: TransitionType.LEFT_TO_RIGHT,
              backgroundColor: const Color(0xFFffab9d),
              borderColor: const Color(0xFFffab9d),
              borderRadius: 50,
              borderWidth: 2,
              onPress: () {},
            ),
          ),
        ],
      ),
    );
  }
}
