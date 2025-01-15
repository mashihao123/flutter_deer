import 'dart:typed_data';
import 'package:cryptography/cryptography.dart';

void main() async {

  // In this example, we use ECDSA-P256-SHA256
  final algorithm = Ecdsa.p256(Sha256());

  // Generate a random key pair
  final secretKey = await algorithm.newKeyPair();
  secretKey.extractPublicKey()

  final publicKey = await algorithm.publicKey(secretKey);

  // Sign a message
  final message = <int>[1,2,3];
  final signature = await algorithm.sign(
    [1,2,3],
    secretKey: secretKey,
  );

  // Anyone can verify the signature
  final isVerified = await algorithm.verify(
    message: message,
    signature: signature,
  );
}
//
// // 生成 NIST P-256 曲线的 EC 密钥对
// Future<SimpleKeyPair> generateECKeyPair() async {
//   final algorithm = BrowserEcKeyPair();
//   final keyPair = await algorithm.newKeyPair();
//   return keyPair;
// }
//
// // 将公钥序列化为 ANSI X9.62/X9.63 非压缩点格式的字节
// Future<Uint8List> encodeUncompressedPublicKey(SimplePublicKey publicKey) async {
//   final bytes = await publicKey.extract();
//   final x = bytes.sublist(1, 33); // X 坐标
//   final y = bytes.sublist(33, 65); // Y 坐标
//
//   // 创建非压缩格式前缀0x04
//   final result = Uint8List(1 + x.length + y.length);
//   result[0] = 0x04; // 非压缩格式标识
//   result.setRange(1, 1 + x.length, x);
//   result.setRange(1 + x.length, result.length, y);
//
//   return result;
// }
