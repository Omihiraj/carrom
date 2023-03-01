import 'package:flutter/material.dart';

import '../models/MyDataModel.dart';

class MemberView extends StatefulWidget {
  MemberView({super.key, required this.userData});
  Map userData;
  @override
  State<MemberView> createState() => _MemberViewState();
}

class _MemberViewState extends State<MemberView> {
  @override
  Widget build(BuildContext context) {
    Map memberData = MyDataModel.processData(widget.userData);
    return Scaffold(
      appBar: AppBar(
        title: Text('${memberData['initname']} Profile'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        children: [
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
        ],
      ),
    );
  }
}
