import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'home_page.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('members');
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
