import 'package:dio/dio.dart';

class SignupRepo {
  final Dio dio;

  SignupRepo(this.dio);

  Future<Map<String, dynamic>> signup({
    required String name,
    required String email,
    required String phone,
    required int gender,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      final response = await dio.post(
        'https://vcare.integration25.com/api/auth/register',
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
        data: FormData.fromMap({
          'name': name,
          'email': email,
          'phone': phone,
          'gender': gender,
          'password': password,
          'password_confirmation': passwordConfirmation,
        }),
      );

      if (response.data['status'] == true) {
        return {
          'token': response.data['data']['token'],
          'username': response.data['data']['username'],
        };
      } else {
        throw Exception(
          response.data['message'] ?? 'Registration failed',
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
          e.response?.data['message'] ?? 'Registration failed',
        );
      }

      throw Exception('Something went wrong');
    }
  }
}