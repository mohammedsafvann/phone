import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone/contact_model.dart';
import 'package:phone/create_new_contact.dart';
import 'package:phone/edit_contact_page.dart';
import 'package:phone/main.dart';
import 'package:phone/edit_contact_page.dart';
// import 'package:untitled/dial_pad.dart';
import 'dial_pad.dart';
import 'second_page.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  int selectedIndex = 0;
  List<dynamic> names = [
    "AAAAAAA",
    "Abnu",
    "Avnhfd",
    "DMeuhk",
    "Agytrdf",
    "Aftrdj",
    "BBBB",
    "CCCC",
    "DDDD",
    "EEEE",
    "FFFF",
    "GGGG",
    "HHHH",
    "IIII",
    "JJJJ",
    "KKKK",
    "LLLL",
    "MMMM",
    "NNNN",
    "BDASD"
  ];

  String check = 'B';

  @override
  // void initState() {
  //   names.sort(
  //     (a, b) =>
  //         a.substring(0).toUpperCase().compareTo(b.substring(0).toUpperCase()),
  //   );
  //   print(names);
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.black54,
        ),
        child: Scaffold(
            floatingActionButton: SizedBox(
              height: 55,
              width: 53,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child:
                    Icon(Icons.dialpad_rounded, color: Colors.black, size: 25),
                backgroundColor: Colors.indigo[100],
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const DialPad(),
                  );
                },
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.white,
              backgroundColor: Colors.black87,
              // fixedColor: Colors.white,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  backgroundColor: Colors.black54,
                  icon: Icon(Icons.star_outline, color: Colors.white),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.access_time_sharp, color: Colors.white),
                  label: 'Recent',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people_alt_sharp, color: Colors.white),
                    label: 'Contacts'),
              ],

              currentIndex: selectedIndex,
              onTap: (int index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              showUnselectedLabels: true,
              showSelectedLabels: true,
              selectedLabelStyle: TextStyle(color: Colors.white),
              unselectedLabelStyle: TextStyle(color: Colors.white),
              selectedItemColor: Colors.white,
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black54,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.black,
                      width: MediaQuery.of(context).size.width,
                      height: 41,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                                gapPadding: 30),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            fillColor: Colors.white24,
                            filled: true,
                            hintText: "Search Contact & Places",
                            hintStyle: const TextStyle(
                              height: .6,
                              color: Colors.white,
                            ),
                            suffixIcon: SizedBox(
                              width: 75,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.mic_none,
                                    size: 22,
                                    color: Colors.white,
                                  ),
                                  PopupMenuButton(
                                    icon: const Icon(Icons.more_vert_rounded,
                                        color: Colors.white),
                                    color: Colors.grey[900],
                                    itemBuilder: (context) {
                                      return [
                                        const PopupMenuItem(
                                            child: Text(
                                          "Call history",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                        const PopupMenuItem(
                                            child: Text(
                                          "Settings",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                        const PopupMenuItem(
                                            child: Text(
                                          "Help & feedback",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      ];
                                    },
                                    onSelected: (value) {
                                      setState(() {
                                        var selected = value;
                                      });
                                    },
                                  )
                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 8),
                                  //   child: Icon(Icons.more_vert_rounded,
                                  //       color: Colors.white, size: 25),
                                  // )
                                ],
                              ),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.black),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.all(Radius.zero)))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CreateNewContact(),
                                    ));
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Icon(Icons.person_add_alt_1_outlined,
                                        color: Colors.blue[100]),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  Center(
                                      child: Text("Create new contact",
                                          style: TextStyle(
                                              color: Colors.blue[100],
                                              fontSize: 16))),
                                ],
                              )),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black,
                      child: ListView.builder(
                          // itemCount: names.length,
                          itemCount: box?.length,
                          itemBuilder: (context, index) {
                            ContactModel contact = box?.getAt(index);
                            List? contactModelList = box?.values.toList();
                            final data = contactModelList?[index];

                            //
                            // if (index > 0) {
                            //   check = names[index - 1][0];
                            // }

                            return check != names[index][0]
                                ? InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Secondpage(
                                            contactdata: data,
                                            // firstName: '${contact.name}',
                                            // lastName: "${contact.lastName}",
                                            // index: index,
                                            // name:
                                            //     "${contact.name}${contact.lastName}",
                                            // phoneNumber:
                                            //     "${contact.phoneNumber}",
                                          ),
                                        )),
                                    child: Container(
                                      color: Colors.black,
                                      width: 150,
                                      height: 60,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12, right: 30),
                                            child: SizedBox(
                                              child: Text(
                                                // "${contact.}",
                                                contact.name?[0]
                                                        .toUpperCase() ??
                                                    "",
                                                // names[index][0],

                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 30),
                                            child: SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.primaries[Random()
                                                          .nextInt(Colors
                                                              .primaries
                                                              .length)],
                                                  // colorList[index],
                                                  child: Text(
                                                      "${contact.name?[0].toUpperCase()}"
                                                      // names[index][0],
                                                      )),
                                            ),
                                          ),
                                          Text(
                                            // names[index].toUpperCase(),
                                            "${contact.name?.toUpperCase()}${contact.lastName?.toUpperCase()}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Secondpage(
                                            contactdata: data,
                                            // firstName: '${contact.name}',
                                            // lastName: "${contact.lastName}",
                                            // index: index,
                                            // // name: names[index],
                                            // name:
                                            //     '${contact.name?.toUpperCase()}',
                                            // // phoneNumber: numbers[index],
                                            // phoneNumber:
                                            //     '${contact.phoneNumber}${contact.lastName}',
                                          ),
                                        )),
                                    child: Container(
                                        color: Colors.black,
                                        width: 150,
                                        height: 60,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 30),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20, right: 30),
                                              child: SizedBox(
                                                height: 40,
                                                width: 40,
                                                child: CircleAvatar(
                                                    backgroundColor: Colors
                                                            .primaries[
                                                        Random().nextInt(Colors
                                                            .primaries.length)],
                                                    // colorList[index],
                                                    child: Text(
                                                        "${contact.name?[0].toUpperCase()}"
                                                        // names[index][0],
                                                        )),
                                              ),
                                            ),
                                            Text(
                                              // names[index].toUpperCase(),
                                              "${contact.name?.toUpperCase()}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14),
                                            )
                                          ],
                                        )),
                                  );
                          }),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
