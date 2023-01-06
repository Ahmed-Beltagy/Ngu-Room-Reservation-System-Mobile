import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:ngu_room_reservation/addingroom.dart';

class RoomManagmnet extends StatelessWidget {
  const RoomManagmnet({super.key});
  @override
  Widget build(BuildContext context) {
    bool goodToGo = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffab9d),
        title: const Text("Managing Rooms.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 170,
          ),
          Center(
            child: AnimatedButton(
              height: 90,
              width: 300,
              text: 'Add new Room.',
              isReverse: true,
              selectedTextColor: Colors.black,
              transitionType: TransitionType.LEFT_TO_RIGHT,
              backgroundColor: const Color(0xFFffab9d),
              borderColor: const Color(0xFFffab9d),
              borderRadius: 50,
              borderWidth: 2,
              onPress: () {
                if (goodToGo) {
                  debugPrint("Going to the moon!");
                } // do your thing
                goodToGo = false;
                Future.delayed(const Duration(milliseconds: 1000), () {
                  goodToGo = true;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AddRoom()));
                });
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: AnimatedButton(
              height: 90,
              width: 300,
              text: 'Search for a Room.',
              isReverse: true,
              selectedTextColor: Colors.black,
              transitionType: TransitionType.LEFT_TO_RIGHT,
              backgroundColor: const Color(0xFFffab9d),
              borderColor: const Color(0xFFffab9d),
              borderRadius: 50,
              borderWidth: 2,
              onPress: () {
                if (goodToGo) {
                  debugPrint("Going to the moon!");
                } // do your thing
                goodToGo = false;
                Future.delayed(const Duration(milliseconds: 1000), () {
                  goodToGo = true;
                  Navigator.pop(context);
                });
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: AnimatedButton(
              height: 90,
              width: 300,
              text: 'Reseve a Room.',
              isReverse: true,
              selectedTextColor: Colors.black,
              transitionType: TransitionType.LEFT_TO_RIGHT,
              backgroundColor: const Color(0xFFffab9d),
              borderColor: const Color(0xFFffab9d),
              borderRadius: 50,
              borderWidth: 2,
              onPress: () {
                if (goodToGo) {
                  debugPrint("Going to the moon!");
                } // do your thing
                goodToGo = false;
                Future.delayed(const Duration(milliseconds: 1000), () {
                  goodToGo = true;
                  Navigator.pop(context);
                });
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
