import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:phone/contact_list.dart';
import 'package:phone/contact_model.dart';

//
// void main() {
//   runApp(const MyApp());
// }

Box? box;

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ContactModelAdapter());
  await Hive.openBox<ContactModel>('contact');
  box = Hive.box<ContactModel>('contact');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactList(),
    );
  }
}
