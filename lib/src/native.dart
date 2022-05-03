import 'package:flutter/services.dart' show MethodChannel, PlatformException;
import 'exception.dart';
import 'type.dart';

const MethodChannel _channel = MethodChannel("flutter_authgear");

Future<String> authenticate(
    {required String url,
    required String redirectURI,
    required bool preferEphemeral}) async {
  try {
    return await _channel.invokeMethod("authenticate", {
      "url": url,
      "redirectURI": redirectURI,
      "preferEphemeral": preferEphemeral,
    });
  } on PlatformException catch (e) {
    throw wrapException(e);
  }
}

Future<void> openURL(String url) async {
  try {
    await _channel.invokeMethod("openURL", {
      "url": url,
    });
  } on PlatformException catch (e) {
    throw wrapException(e);
  }
}

Future<Map> getDeviceInfo() async {
  try {
    return await _channel.invokeMethod("getDeviceInfo");
  } on PlatformException catch (e) {
    throw wrapException(e);
  }
}

Future<void> storageSetItem(String key, String value) async {
  try {
    await _channel.invokeMethod("storageSetItem", {
      "key": key,
      "value": value,
    });
  } on PlatformException catch (e) {
    throw wrapException(e);
  }
}

Future<String?> storageGetItem(String key) async {
  try {
    return await _channel.invokeMethod("storageGetItem", {
      "key": key,
    });
  } on PlatformException catch (e) {
    throw wrapException(e);
  }
}

Future<void> storageDeleteItem(String key) async {
  try {
    await _channel.invokeMethod("storageDeleteItem", {
      "key": key,
    });
  } on PlatformException catch (e) {
    throw wrapException(e);
  }
}

Future<String> generateUUID() async {
  try {
    return await _channel.invokeMethod("generateUUID");
  } on PlatformException catch (e) {
    throw wrapException(e);
  }
}

Future<void> checkBiometricSupported({
  required BiometricOptionsIOS ios,
  required BiometricOptionsAndroid android,
}) async {
  try {
    await _channel.invokeMethod("checkBiometricSupported", {
      "ios": ios.toMap(),
      "android": android.toMap(),
    });
  } on PlatformException catch (e) {
    throw wrapException(e);
  }
}

Future<String> createBiometricPrivateKey({
  required String kid,
  required Map<String, dynamic> payload,
  required BiometricOptionsIOS ios,
  required BiometricOptionsAndroid android,
}) async {
  try {
    return await _channel.invokeMethod("createBiometricPrivateKey", {
      "kid": kid,
      "payload": payload,
      "ios": ios.toMap(),
      "android": android.toMap(),
    });
  } on PlatformException catch (e) {
    throw wrapException(e);
  }
}

Future<void> removeBiometricPrivateKey(String kid) async {
  try {
    return await _channel.invokeMethod("removeBiometricPrivateKey", {
      "kid": kid,
    });
  } on PlatformException catch (e) {
    throw wrapException(e);
  }
}

Future<String> signWithBiometricPrivateKey({
  required String kid,
  required Map<String, dynamic> payload,
  required BiometricOptionsIOS ios,
  required BiometricOptionsAndroid android,
}) async {
  try {
    return await _channel.invokeMethod("signWithBiometricPrivateKey", {
      "kid": kid,
      "payload": payload,
      "ios": ios.toMap(),
      "android": android.toMap(),
    });
  } on PlatformException catch (e) {
    throw wrapException(e);
  }
}

Future<String> createAnonymousPrivateKey({
  required String kid,
  required Map<String, dynamic> payload,
}) async {
  try {
    return await _channel.invokeMethod("createAnonymousPrivateKey", {
      "kid": kid,
      "payload": payload,
    });
  } on PlatformException catch (e) {
    throw wrapException(e);
  }
}

Future<String> signWithAnonymousPrivateKey({
  required String kid,
  required Map<String, dynamic> payload,
}) async {
  try {
    return await _channel.invokeMethod("signWithAnonymousPrivateKey", {
      "kid": kid,
      "payload": payload,
    });
  } on PlatformException catch (e) {
    throw wrapException(e);
  }
}
