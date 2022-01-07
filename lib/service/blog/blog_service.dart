import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login/repository/repo.dart';

class BlogService {
  Dio dio = Dio();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  final repository = Repo().url;

  Future<List<dynamic>> get() async {
    final token = await storage.read(key: 'token');

    try {
      Response response = await dio.get('$repository/blogs',
          options: Options(
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $token',
              },
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }));
      return response.data['data'];
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
