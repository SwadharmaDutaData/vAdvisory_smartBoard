part of 'shared.dart';

class LocalStorage {
  final storage = const FlutterSecureStorage();

  void writeValue(String key, dynamic value) async {
    await storage.write(key: key, value: value);
  }

  void deleteValue(String key) async {
    await storage.delete(key: key);
  }

  Future readValue(String key) async {
    String? value = await storage.read(key: key);
    return value;
  }

  void deleteAll() {
    storage.deleteAll();
  }
}
