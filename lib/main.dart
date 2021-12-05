import 'package:flutter/material.dart';

import 'encryption pages/encryption_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Encryption',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EncryptionPage(),
    );
  }
}
