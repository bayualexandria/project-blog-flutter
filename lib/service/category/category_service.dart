import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as Storage;
import 'package:login/repository/repo.dart';

class CategoryService {
  Storage.FlutterSecureStorage storage = const Storage.FlutterSecureStorage();

  final repository = Repo().url;
  Dio dio = Dio();

  Future<List<dynamic>> get() async {
    final token = await storage.read(key: 'token');

    try {
      Response response = await dio.get('$repository/categories',
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
      // List<Category> category = data.map((e) => Category.fromJson(e)).toList();
      // Category category = Category.fromJson(response.data);
      return response.data['data'];
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
