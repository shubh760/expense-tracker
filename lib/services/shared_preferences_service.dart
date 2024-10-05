import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String _keyName = 'user_name';
  static const String _keyGender = 'user_gender';
  static const String _keyAge = 'user_age';
  static const String _keyOccupation = 'user_occupation';

  // Save user details
  static Future<void> saveUserDetails({
    required String name,
    required String age,
    required String occupation,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, name);
    await prefs.setString(_keyAge, age);
    await prefs.setString(_keyOccupation, occupation);
  }

  // Get user name
  static Future<String?> getName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyName);
  }

  // Get user gender
  static Future<String?> getGender() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyGender);
  }

  // Get user age
  static Future<String?> getAge() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyAge);
  }

  // Get user occupation
  static Future<String?> getOccupation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyOccupation);
  }

  // Get all user details
  static Future<Map<String, dynamic>> getAllUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString(_keyName),
      'gender': prefs.getString(_keyGender),
      'age': prefs.getInt(_keyAge),
      'occupation': prefs.getString(_keyOccupation),
    };
  }

  // Clear all user details
  static Future<void> clearUserDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyName);
    await prefs.remove(_keyGender);
    await prefs.remove(_keyAge);
    await prefs.remove(_keyOccupation);
  }
}
/* 
// Usage example
void main() async {
  // Save user details
  await UserPreferences.saveUserDetails(
    name: 'John Doe',
    gender: 'Male',
    age: 30,
    occupation: 'Software Developer'
  );

  // Retrieve individual details
  String? name = await UserPreferences.getName();
  String? gender = await UserPreferences.getGender();
  int? age = await UserPreferences.getAge();
  String? occupation = await UserPreferences.getOccupation();

  print('Name: $name');
  print('Gender: $gender');
  print('Age: $age');
  print('Occupation: $occupation');

  // Retrieve all details at once
  Map<String, dynamic> allDetails = await UserPreferences.getAllUserDetails();
  print('All details: $allDetails');

  // Clear all details
  await UserPreferences.clearUserDetails();
} */