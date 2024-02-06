// import 'dart:convert';
// import "package:pointycastle/block/aes_fast.dart";
// import "package:pointycastle/block/modes/cbc.dart";
// import "package:pointycastle/block/modes/cfb.dart";
// import 'package:pointycastle/pointycastle.dart';

// class AESHelper {
//   static final key = 'your_aes_key_here'; // Gerçek AES anahtarını buraya yerleştirin

//   static String encrypt(String text) {
//     try {
//       final keyBytes = utf8.encode(key);
//       final iv = List.generate(16, (i) => 0); // IV, 16 byte'lık bir sıfır dizisi olarak ayarlandı

//       final params = KeyParameter(keyBytes);
//       final cipher = CBCBlockCipher(AESFastEngine());
//       final padding = PaddedBlockCipherPadding(null);

//       final encrypter = PaddedBlockCipher(padding)..init(true, params); // Şifreleme modu: true -> Şifreleme

//       final encryptedBytes = encrypter.process(utf8.encode(text));
//       final encryptedText = base64.encode(encryptedBytes);
//       return encryptedText;
//     } catch (e) {
//       print("Encryption error: $e");
//       return '';
//     }
//   }

//   static String decrypt(String encryptedText) {
//     try {
//       // final keyBytes = utf8.encode(key);
//       // final iv = List.generate(16, (i) => 0); // IV, 16 byte'lık bir sıfır dizisi olarak ayarlandı

//       // final params = KeyParameter(keyBytes);
//       // // final cipher = CBCBlockCipher(AESFastEngine());
//       // final padding = Padding("PKCS5");

//       // final decrypter = cipher..init(false, ); // Şifreleme modu: false -> Çözme

//       var cipher = CFBBlockCipher(AESFastEngine(), 16);
// cipher.init(false, PaddedBlockCipherParametersImpl(
//     PKCS7Padding(), KeyParameter(key)));
// var decryptedData = cipher.process(encryptedData);
//       final encryptedBytes = base64.decode(encryptedText);
//       final decryptedBytes = decrypter.process(encryptedBytes);
//       final decryptedText = utf8.decode(decryptedBytes);
//       return decryptedText;
//     } catch (e) {
//       print("Decryption error: $e");
//       return '';
//     }
//   }
// }
