import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:phone/contact_list.dart';
import 'package:phone/contact_model.dart';
import 'package:phone/main.dart';

// import 'package:untitled/second_page.dart';

class EditContactPage extends StatefulWidget {
  // final String name;
  // final String phoneNumber;
  // final String lastName;
  // final String firstName;
  // final int index;
  final ContactModel contactdata;

  EditContactPage({
    super.key,
    required this.contactdata,
    // required this.name,
    // required this.phoneNumber,
    // required this.index,
    // required this.lastName,
    // required this.firstName,
  });

  @override
  State<EditContactPage> createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  String firstvalue = 'No label';
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
  String initiol = 'No label';
  var secondoption = ["No label", 'Mobile', 'Work', 'other', 'Custom'];
  List<String> categories = [
    'No label',
    'Birthday',
    'Anniversary',
    'other',
    'custom'
  ];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController labelController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  String firstcategories = 'No label';

  // late Box<ContactModel> contactBox;

  @override
  void initState() {
    // nameController.text = widget.contactdata.name!;
    lastNameController.text = widget.contactdata.lastName!;
    firstNameController.text = widget.contactdata.name!;

    //
    phoneController.text = widget.contactdata.phoneNumber!;
    // mailController.text = "mohammedsafvan@gamil.com";
    // labelController.text = 'Work';
    // contactBox = Hive.box('contact');

    // print('contact: ${contactBox.values}');

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(
                  context,
                ),
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
        actions: [
          Row(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(right: 15),
              //   child: Icon(Icons.close),
              // ),
              const Padding(
                padding: EdgeInsets.only(right: 60),
                child: Text("Edit contact",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // var newContact = box?.get(
                    //   ContactModel(
                    //       name: widget.name,
                    //       phoneNumber: widget.phoneNumber),
                    // );
                    box?.put(
                      // widget.index,
                      widget.contactdata,
                      ContactModel(
                        lastName: lastNameController.text,
                        name: nameController.text,
                        phoneNumber: phoneController.text,
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactList(),
                      ),
                    );

                    // box?.put(
                    //     ContactModel(
                    //         name: nameController.text,
                    //         phoneNumber: phoneController.text),
                    //     );

                    //
                    print(nameController.text);
                    print(phoneController.text);
                    //   print(phoneController.text);
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black87),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(80, 25),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.blue[300],
                  ),
                ),
              ),
              PopupMenuButton(
                icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
                color: Colors.grey[900],
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                        child: Text(
                      "Delete",
                      style: TextStyle(color: Colors.white),
                    )),
                    const PopupMenuItem(
                      child: Text(
                        "Help & feedback",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ];
                },

                // onSelected: (value) {
                //   setState(() {
                //     var selectedItem = value;
                //   });
                // },
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 55,
              color: Colors.grey[900],
              child: Row(
                children: [
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
                ],
              ),
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
                      style: TextStyle(color: Colors.white),
                      controller: firstNameController,
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
                controller: lastNameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
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
            SizedBox(
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
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white),
                      controller: phoneController,
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
                    onChanged: (String? newValue) {
                      setState(() {
                        firstvalue = newValue!;
                      });
                    }),
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
                      controller: mailController,
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48, right: 150),
              child: SizedBox(
                height: 60,
                width: 150,
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
                    items: secondoption.map((String secondoption) {
                      return DropdownMenuItem(
                        child: Text(secondoption,
                            style: TextStyle(color: Colors.white)),
                        value: secondoption,
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        initiol = newValue!;
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.event,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: TextFormField(
                      readOnly: true,
                      style: TextStyle(color: Colors.white),
                      controller: dateController,
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime(2040).add(Duration(days: 365)),
                        );
                        setState(() {
                          dateController.text = date.toString();
                        });
                        print(date);
                      },
                      decoration: InputDecoration(
                          label: Text('Significant date',
                              style: TextStyle(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1))),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48, right: 150),
              child: SizedBox(
                height: 60,
                width: 150,
                child: DropdownButtonFormField(
                    dropdownColor: Colors.grey[900],
                    decoration: InputDecoration(
                      label:
                          Text("Label", style: TextStyle(color: Colors.white)),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                    items: categories.map((String categories) {
                      return DropdownMenuItem(
                          child: Text(categories,
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          value: categories);
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        firstcategories = newValue!;
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "More fields",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
