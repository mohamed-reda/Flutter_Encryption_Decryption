import 'package:flutter/material.dart';

Widget commonTextAndEncrypted({
  required String plainText,
  required var encryptedText,
  required String encryptedType,
}) {
  return Column(
    children: [
      Text(
        encryptedType,
        style: TextStyle(
          fontSize: 25,
          color: Colors.blue[400],
          fontWeight: FontWeight.w600,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(encryptedText),
      ),
    ],
  );
}
