import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quietpaper/models/models.dart';

class Repository {
  List<GetData> data = [];
  Dio _dio = Dio();
  Future<List<GetData>> fetchData() async {
    try {
      var response = await _dio.get(
        'https://api.thecatapi.com/v1/images/search',
      );
      for (var element in response.data) {
        data.add(GetData.fromJson(element));
      }
      return data;
    } catch (e) {
      log(e.toString());
      throw Exception('$e');
    }
  }
}

final repositoryProvider = Provider((ref) => Repository());
