import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    setLoading(true);

    try {
      Response response =
          await post(Uri.parse("https://reqres.in/api/login"), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        setLoading(false);

        print("Login succeful");
      } else {
        // setLoading(true);

        print("Login unsucceful");
      }
    } catch (e) {
      // setLoading(true);

      print(e.toString());
    }
  }
}
