import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:untitled/dial_pad.dart';

class CallingPage extends StatefulWidget {
  final String name;
  final String phonenumbers;

  const CallingPage({
    super.key,
    required this.name,
    required this.phonenumbers,
  });

  @override
  State<CallingPage> createState() => _CallingPageState();
}

class _CallingPageState extends State<CallingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: SizedBox(
          height: 30,
          child: Center(
              child: Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                child: Text(widget.name[0].toUpperCase(),
                    style: TextStyle(color: Colors.black, fontSize: 40)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Calling...",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.name.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "phone +91 " + widget.phonenumbers,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                height: 179,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: 232,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 25,
                                    child: Icon(Icons.dialpad_rounded,
                                        size: 20, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Keypad",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 25,
                                    child: Icon(Icons.mic_off_outlined,
                                        size: 20, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Mute",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 25,
                                    child: Icon(Icons.volume_up_outlined,
                                        size: 20, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Speaker",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 25,
                                    child: Icon(Icons.more_vert_rounded,
                                        size: 20, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "More",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CircleAvatar(
                      child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.call_end_outlined,
                            size: 35,
                            color: Colors.black,
                          )),
                      // Icon(Icons.call_end_outlined,
                      //     color: Colors.black, size: 35),
                      radius: 30,
                      backgroundColor: Colors.red[700],
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    ));
  }
}
