import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import 'process_view.dart';

class AddMember extends StatefulWidget {
  const AddMember({super.key});

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobNo = TextEditingController();

  String memberType = "VIP";
  List<String> memTypeList = <String>[
    'VIP',
    'Gold',
    'General',
  ];
  String genderType = "MALE";
  List<String> genTypeList = <String>[
    'MALE',
    'FEMALE',
  ];
  String startDate = "yyyy/mm/dd";
  DateTime sDate = DateTime.now();

  final memBox = Hive.box('members');
  String id = const Uuid().v1().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add New Member'),
          backgroundColor: Colors.purple,
        ),
        body: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('Full Name'),
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Enter Full Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Full Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Address'),
                    TextFormField(
                      controller: address,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Enter your Address',
                      ),
                      maxLines: 5,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Contact No'),
                    TextFormField(
                      controller: mobNo,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Enter Contact No',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your contact';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("Gender"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                          underline: Container(),
                          value: genderType,
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              genderType = value!;
                            });
                          },
                          items: genTypeList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Birth Day'),
                    InkWell(
                      onTap: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: sDate,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        if (newDate == null) return;
                        setState(() {
                          sDate = newDate;
                          startDate =
                              "${sDate.year}/${sDate.month}/${sDate.day}";
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        child: Row(
                          children: [
                            Text(startDate),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.calendar_month,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("Membership Type"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                          underline: Container(),
                          value: memberType,
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              memberType = value!;
                            });
                          },
                          items: memTypeList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            Center(
                child: InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  memBox.put(id, {
                    'name': name.text.trim(),
                    'address': address.text,
                    'mobile': mobNo.text,
                    'gender': genderType,
                    'birthday': sDate,
                    'memtype': memberType
                  }).then((value) {
                    Map userData = memBox.get(id);
                    return Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProcessView(
                                  userData: userData,
                                )));
                  });
                }
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    "Add Memeber",
                    style: TextStyle(color: Colors.white),
                  )),
            )),
          ],
        ));
  }
}
