// lib/data/sources/sneaker_local_data_source.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/sneaker_model.dart';

abstract class SneakerLocalDataSource {
  Future<List<SneakerModel>> fetchSneakers();
}

class SneakerLocalDataSourceImpl implements SneakerLocalDataSource {
  @override
  Future<List<SneakerModel>> fetchSneakers() async {
    try {
      await Future.delayed(Duration(seconds: 2));

      final String response = await rootBundle.loadString('assets/shoes.json');
      // print('Raw JSON response');

      final List<dynamic> data = json.decode(response);
      // print('Decoded JSON data');

      final sneakers = data.map((json) => SneakerModel.fromJson(json)).toList();

      return sneakers;
    } catch (e) {
      // print('Error loading sneakers: $e');
      return [];
    }
  }
}
