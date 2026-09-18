import 'package:dio/dio.dart';

class LoginRepo {
  final Dio dio;

  LoginRepo(this.dio);

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'https://vcare.integration25.com/api/auth/login',
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.data['status'] == true) {
        return {
          'token': response.data['data']['token'],
          'username': response.data['data']['username'],
        };
      } else {
        throw Exception(
          response.data['message'] ?? 'Login failed',
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
          e.response?.data['message'] ?? 'Login failed',
        );
      }

      throw Exception('Something went wrong');
    }
  }
}