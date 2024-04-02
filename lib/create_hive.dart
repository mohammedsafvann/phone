import 'package:flutter/material.dart';

class CreateHive extends StatefulWidget {
  const CreateHive({super.key});

  @override
  State<CreateHive> createState() => _CreateHiveState();
}

class _CreateHiveState extends State<CreateHive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Icon(Icons.add, color: Colors.blue, size: 50),
      body: Center(
          child: Container(
        height: 400,
        width: 250,
        color: Colors.grey,
        child: TextFormField(
          onTap: () {},
        ),
      )),
    );
  }
}
