class AuthService {
  static String? token;

  // Guardar
  static void saveToken(String newToken) {
    token = newToken;
  }

  // Get
  static String? getToken() {
    return token;
  }

  // Borrar
  static void clearToken() {
    token = null;
  }
}
