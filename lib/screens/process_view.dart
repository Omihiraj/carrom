import 'package:carrom/models/MyDataModel.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class ProcessView extends StatelessWidget {
  ProcessView({super.key, required this.userData});

  Map userData;

  @override
  Widget build(BuildContext context) {
    Map memberData = MyDataModel.processData(userData);
    return Scaffold(
      body: ListView(
        children: [
          const Center(
              child: Text("Member Added Successfully",
                  style: TextStyle(fontSize: 24, color: Colors.green))),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text("Full Name"),
            subtitle: Text(memberData['fullname']),
          ),
          ListTile(
            title: const Text("Name with initials"),
            subtitle: Text(memberData['initname']),
          ),
          ListTile(
            title: const Text("Address"),
            subtitle: Text(memberData['address']),
          ),
          ListTile(
            title: const Text("Reverse Address"),
            subtitle: Text(memberData['readdress']),
          ),
          ListTile(
            title: const Text("Local Contact"),
            subtitle: Text(memberData['lcontact']),
          ),
          ListTile(
            title: const Text("International Contact"),
            subtitle: Text(memberData['icontact']),
          ),
          ListTile(
            title: const Text("Contact No Type"),
            subtitle: Text(memberData['ctype']),
          ),
          ListTile(
            title: const Text("Gender"),
            subtitle: Text(memberData['gender']),
          ),
          ListTile(
            title: const Text("Age"),
            subtitle: Text(memberData['age'].toString()),
          ),
          ListTile(
            title: const Text("Birth Day"),
            subtitle: Text(memberData['birthday'].toString()),
          ),
          ListTile(
            title: const Text("Member Type"),
            subtitle: Text(memberData['memtype']),
          ),
          ListTile(
            title: const Text("Amount Without Tax"),
            subtitle: Text(memberData['withouttax']),
          ),
          ListTile(
            title: const Text("Final Amount"),
            subtitle: Text(memberData['finalamount'].toString()),
          ),
          Center(
              child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(20),
                child: const Text(
                  "Go to Home",
                  style: TextStyle(color: Colors.white),
                )),
          )),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
