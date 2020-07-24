import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:habit_tracker/.config/.credentials.dart';

Future<String> refreshSheetsToken() async {
  String refreshUrl = sheets_credentials['REFRESH_URI'];
  String clientId = sheets_credentials['CLIENT_ID'];
  String clientSecret = sheets_credentials['CLIENT_SECRET'];
  String refreshToken = sheets_credentials['REFRESH_TOKEN'];
  String url = '${refreshUrl}?client_id=${clientId}&client_secret=${clientSecret}&refresh_token=${refreshToken}&grant_type=refresh_token';

  final http.Response response = await http.post(url, headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
  });

  return json.decode(response.body)['access_token'];
}