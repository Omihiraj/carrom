import 'package:carrom/screens/member_view.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'screens/add_member.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final memBox = Hive.box('members');
  @override
  Widget build(BuildContext context) {
    List members = memBox.values.toList();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddMember()));
          }),
      appBar: AppBar(
        title: const Text("Carrom Member App"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: members.isEmpty
          ? const Center(child: Text('Please Add Members'))
          : ListView.builder(
              itemCount: memBox.values.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    '${members[index]['name']}',
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                  subtitle: Text(
                    '${members[index]['memtype']}',
                    style:
                        const TextStyle(fontSize: 14, color: Colors.lightBlue),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MemberView(userData: members[index])));
                  },
                );
              }),
    );
  }
}
