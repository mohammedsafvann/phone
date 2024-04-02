import 'package:flutter/material.dart';

import 'package:phone/contact_model.dart';
import 'package:phone/main.dart';

class CreateNewContact extends StatefulWidget {
  const CreateNewContact({super.key});

  @override
  State<CreateNewContact> createState() => _CreateNewContactState();
}

class _CreateNewContactState extends State<CreateNewContact> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  // final contactNumber = TextEditingController();
  final phoneNumber = TextEditingController();
  final lastname = TextEditingController();
  var options = [
    "No label",
    "Phone",
    "Work",
    "Home",
    "Main",
    "Work fax",
    "Home fax",
    "pager",
    "other"
  ];

  get secondOption => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              )),
          backgroundColor: Colors.black,
          actions: [
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 15),
                //   child: Icon(Icons.close),
                // ),
                const Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text("Create contact",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.white)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          box?.add(

                              // "${nameController}",
                              ContactModel(
                                  lastName: lastname.text,
                                  name: nameController.text,
                                  phoneNumber: phoneNumber.text));
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Save",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black87)),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(80, 25),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(),
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: Colors.blue[300])),
                ),
                PopupMenuButton(
                  icon: Icon(Icons.more_vert_rounded, color: Colors.white),
                  color: Colors.grey[900],
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          child: Text(
                        "Delete",
                        style: TextStyle(color: Colors.white),
                      )),
                      PopupMenuItem(
                          child: Text(
                        "Help & feedback",
                        style: TextStyle(color: Colors.white),
                      )),
                    ];
                  },
                )
              ],
            )
          ]),
      body: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 55,
                color: Colors.grey[900],
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text("Saved to",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white)),
                  ),
                  // SizedBox(
                  //   width: ,
                  // ),
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage(
                        'assets/images/kisspng-cristiano-ronaldo-real-madrid-c-f-the-best-fifa-f-the-best-5ad978c26d0d83.3753809715242016664467.jpg'),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "mohammedsafvan.nondath@gmail.com",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  )
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: CircleAvatar(
                    child: Icon(Icons.add_photo_alternate_outlined,
                        color: Colors.white, size: 50),
                    backgroundColor: Colors.grey[700],
                    radius: 65),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Add picture",
                style: TextStyle(
                    color: Colors.blueAccent, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.perm_identity_outlined,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 40),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please Enter your name';
                          }
                          return null;
                        },
                        controller: nameController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            label: Text("Name",
                                style: TextStyle(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            )),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              width: 1,
                            ))),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 53, right: 40),
                child: TextFormField(
                  controller: lastname,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your last name";
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      label: Text("Last name",
                          style: TextStyle(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      )),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        width: 1,
                      ))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.apartment_rounded,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 40),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            label: Text("Company",
                                style: TextStyle(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            )),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              width: 1,
                            ))),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.call_outlined,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 40),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please enter number';
                          } else if (value.length != 10) {
                            return "Enter 10 digit number";
                          }
                          return null;
                        },
                        controller: phoneNumber,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            label: Text("phone",
                                style: TextStyle(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            )),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              width: 1,
                            ))),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 48, right: 150),
                child: SizedBox(
                  width: 150,
                  height: 60,
                  child: DropdownButtonFormField(
                      dropdownColor: Colors.grey[900],
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2,
                          )),
                          label: Text(
                            "Label",
                            style: TextStyle(color: Colors.white),
                          )),
                      items: options.map((String options) {
                        return DropdownMenuItem(
                          child: Text(options,
                              style: TextStyle(color: Colors.white)),
                          value: options,
                        );
                      }).toList(),
                      onChanged: (String? newValue) {}),
                ),
              ),

              //DropdownButtonFormField(
              //  items: items.map((items)), onChanged: onChanged),
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(Icons.email_outlined, color: Colors.white),
                  ),
                  SizedBox(
                    width: 19,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            label: Text("Email",
                                style: TextStyle(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            )),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              width: 1,
                            ))),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "More fields",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    )),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
