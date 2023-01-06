import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:ngu_room_reservation/Rooms.dart';

class AddRoom extends StatefulWidget {
  const AddRoom({Key? key}) : super(key: key);

  @override
  State<AddRoom> createState() => _AddRoom();
}

class _AddRoom extends State<AddRoom> {
  _AddRoom() {
    _selectedstatus = status[0];
    _selectedtype = type[0];
    _selectedbuilding = buildings[0];
  }

  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _roomName;
  late final TextEditingController _capacity;
  //late final TextEditingController _Puplic_private;
  //late final TextEditingController _type;
  late final TextEditingController _buildingname;

  @override
  void initState() {
    super.initState();
    _roomName = TextEditingController();
    _capacity = TextEditingController();
    //_Puplic_private = TextEditingController();
    //_type = TextEditingController();
    _buildingname = TextEditingController();
  }

  // Items that will be in the Drop Down Button
  final status = ["public", "private"];
  final type = [
    "Lecture Room",
    "Lab",
    "Professors Room",
    "Dean Room",
    "Generator Room",
    "Storage Room",
    "Meeting Room",
    "Library"
  ];
  final buildings = ["A", "B", "C", "D"];

  // Values captured from the dropdownbutton
  String? _selectedstatus = "";
  String? _selectedtype = "";
  String? _selectedbuilding = "";

  @override
  void dispose() {
    _roomName.dispose();
    _capacity.dispose();
    //_Puplic_private.dispose();
    //_type.dispose();
    _buildingname.dispose();

    super.dispose();
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Popup example'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("Hello"),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool goodToGo = true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFffab9d),
        title: const Text("Add new Room.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _roomName,
                decoration: const InputDecoration(labelText: 'Room Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  // bool emailValid = RegExp(
                  //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  //     .hasMatch(value);

                  // if (!emailValid) {
                  //   return 'Please enter a valid email';
                  // }
                  return null;
                },
              ),
              TextFormField(
                controller: _capacity,
                decoration: const InputDecoration(labelText: 'Capacity'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  // if (value.length < 6) {
                  //   return "Password must be at least 6 characters";
                  // }
                  return null;
                },
              ),
              DropdownButtonFormField(
                value: _selectedtype,
                items: type
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedtype = val as String;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xFFffab9d),
                ),
                dropdownColor: const Color(0xFFffab9d),
                decoration: const InputDecoration(
                    labelText: "Type", border: UnderlineInputBorder()),
              ),
              DropdownButtonFormField(
                value: _selectedstatus,
                items: status
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedstatus = val as String;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xFFffab9d),
                ),
                dropdownColor: const Color(0xFFffab9d),
                decoration: const InputDecoration(
                    labelText: "Public / Private",
                    border: UnderlineInputBorder()),
              ),
              DropdownButtonFormField(
                value: _selectedbuilding,
                items: buildings
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedbuilding = val as String;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xFFffab9d),
                ),
                dropdownColor: const Color(0xFFffab9d),
                decoration: const InputDecoration(
                    labelText: "Building Name", border: UnderlineInputBorder()),
              ),
              const SizedBox(
                height: 50,
              ),
              AnimatedButton(
                height: 70,
                width: 200,
                text: 'Save & Return.',
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
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      Navigator.pop(context);
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
