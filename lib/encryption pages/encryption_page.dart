import 'package:encryption_decryption/common_ui/text_and_encrypted.dart';
import 'package:encryption_decryption/logic/encryption_decryption.dart';
import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionPage extends StatefulWidget {
  @override
  _EncryptionPageState createState() => _EncryptionPageState();
}

class _EncryptionPageState extends State<EncryptionPage> {
  TextEditingController tec = TextEditingController();
  String plainText = '';
  var encryptedText;
  var fernetText;
  var Salsa20Text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Encryption/Decryption"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: tec,
              ),
            ),
            Text(
              "PLAIN TEXT",
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue[400],
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(plainText),
            ),
            commonTextAndEncrypted(
                plainText: plainText,
                encryptedText: encryptedText == null
                    ? ""
                    : encryptedText is encrypt.Encrypted
                        ? encryptedText.base64
                        : encryptedText,
                encryptedType: "AES ENCRYPTED TEXT"),
            commonTextAndEncrypted(
              encryptedType: "Fernet ENCRYPTED TEXT",
              plainText: plainText,
              encryptedText: fernetText == null
                  ? ""
                  : fernetText is encrypt.Encrypted
                      ? fernetText.base64
                      : fernetText,
            ),
            commonTextAndEncrypted(
              encryptedType: "Salsa20 ENCRYPTED TEXT",
              plainText: plainText,
              encryptedText: Salsa20Text == null
                  ? ""
                  : Salsa20Text is encrypt.Encrypted
                      ? Salsa20Text.base64
                      : Salsa20Text,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    plainText = tec.text == "" ? plainText : tec.text;
                    if (plainText.isNotEmpty) {
                      setState(() {
                        encryptedText =
                            MyEncryptionDecryption.encryptAES(plainText);
                        fernetText =
                            MyEncryptionDecryption.encryptFernet(plainText);
                        Salsa20Text =
                            MyEncryptionDecryption.encryptSalsa20(plainText);
                      });
                      tec.clear();
                    }
                  },
                  child: const Text("Encrypt"),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (plainText.isNotEmpty) {
                      setState(() {
                        encryptedText =
                            MyEncryptionDecryption.decryptAES(encryptedText);
                        fernetText =
                            MyEncryptionDecryption.decryptFernet(fernetText);
                        Salsa20Text =
                            MyEncryptionDecryption.decryptSalsa20(Salsa20Text);
                      });
                    }
                  },
                  child: const Text("Decrypt"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
