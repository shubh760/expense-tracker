import 'package:hive/hive.dart';
import 'dart:convert';

class HiveJsonHelper {
  static const String _boxName = 'jsonDataBox';
  static const String _listKey = 'jsonDataList';

  // Open the Hive box
  static Future<Box> _openBox() async {
    if (!Hive.isBoxOpen(_boxName)) {
      return await Hive.openBox(_boxName);
    }
    return Hive.box(_boxName);
  }

  // Initialize the list if it doesn't exist
  static Future<void> _initializeList() async {
    final box = await _openBox();
    if (!box.containsKey(_listKey)) {
      await box.put(_listKey, []);
    }
  }

  // Add JSON data to the list
  static Future<void> addJsonData(Map<String, dynamic> jsonData) async {
    await _initializeList();
    final box = await _openBox();
    List<dynamic> dataList = box.get(_listKey);
    dataList.add(jsonEncode(jsonData));
    await box.put(_listKey, dataList);
  }

  // Get all JSON data
  static Future<List<Map<String, dynamic>>> getAllJsonData() async {
    await _initializeList();
    final box = await _openBox();
    List<dynamic> dataList = box.get(_listKey);
    return dataList.map((item) => jsonDecode(item) as Map<String, dynamic>).toList();
  }

  // Delete JSON data at a specific index
  static Future<void> deleteJsonData(int index) async {
    await _initializeList();
    final box = await _openBox();
    List<dynamic> dataList = box.get(_listKey);
    if (index >= 0 && index < dataList.length) {
      dataList.removeAt(index);
      await box.put(_listKey, dataList);
    }
  }

  // Modify JSON data at a specific index
  static Future<void> modifyJsonData(int index, Map<String, dynamic> newJsonData) async {
    await _initializeList();
    final box = await _openBox();
    List<dynamic> dataList = box.get(_listKey);
    if (index >= 0 && index < dataList.length) {
      dataList[index] = jsonEncode(newJsonData);
      await box.put(_listKey, dataList);
    }
  }

  // Clear all JSON data
  static Future<void> clearAllJsonData() async {
    await _initializeList();
    final box = await _openBox();
    await box.put(_listKey, []);
  }
}