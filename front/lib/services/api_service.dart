import 'dart:convert';
import 'package:http/http.dart' as http;
import 'auth_service.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1/API_PHP/src';


  // login
  static Future<String?> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/auth.php');
    final response = await http.post(
      url,
      body: {'login': '', 'username': username, 'password': password},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['token'] != null) {
        return data['token'];
      }
    }
    return null;
  }

  // Read
  static Future<Map<String, dynamic>?> getUserData() async {
    final token = AuthService.getToken();
    if (token == null) {
      return null;
    }

    final url = Uri.parse('$baseUrl/crud.php');
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': '$token'},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Error en la API: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error al conectar con la API: $e');
      return null;
    }
  }



  // Update
  static Future<bool> updateUser(String username, String email, {String? password}) async {
    final token = AuthService.getToken();
    if (token == null) return false;

    final url = Uri.parse('$baseUrl/crud.php');
    try {
      final body = {
        'username': username,
        'email': email,
      };

      if (password != null && password.isNotEmpty) {
        body['password'] = password;
      }

      final response = await http.put(
        url,
        headers: {'Authorization': 'Bearer $token'},
        body: body,
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        print(result['message']);
        return true;
      } else {
        print('Error en la API (PUT): ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error al conectar con la API (PUT): $e');
      return false;
    }
  }


  // Delete
  static Future<bool> deleteUser() async {
    final token = AuthService.getToken();
    if (token == null) return false;

    final url = Uri.parse('$baseUrl/crud.php');
    try {
      final response = await http.delete(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        print(result['message']);
        return true;
      } else {
        print('Error en la API (DELETE): ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error al conectar con la API (DELETE): $e');
      return false;
    }
  }

  //Registrar
  static Future<bool> register(String username, String password, String email) async {
    final url = Uri.parse('$baseUrl/auth.php');
    try {
      final response = await http.post(
        url,
        body: {
          'register': '',
          'username': username,
          'password': password,
          'email': email,
        },
      );


      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['message'] == 'Registro exitoso') {
          return true;
        }
      }
      return false;
    } catch (e) {
      print('Error al conectar con la API: $e');
      return false;
    }
  }



}
