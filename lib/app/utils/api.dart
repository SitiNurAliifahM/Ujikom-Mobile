import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resepku_p5/app/data/resep_response.dart';


class BaseUrl {
  static String login = 'http://192.168.74.252:8000/api/login';
  static String logout = 'http://192.168.74.252:8000/api/logout';

  static String kategoris = 'http://192.168.74.252:8000/api/kategori';
  static String reseps = 'http://192.168.74.252:8000/api/resep';

  static String profile = 'http://192.168.74.252:8000/api/profile';
}
