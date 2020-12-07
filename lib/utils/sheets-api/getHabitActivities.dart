import 'dart:convert';
import 'dart:io';
import 'package:habit_tracker/.config/.credentials.dart';
import 'package:habit_tracker/models/HabitActivity.dart';
import 'package:http/http.dart' as http;

Future<List<HabitActivity>> getHabitActivities(String accessToken) async {
  String sheetsApiUrl = sheets_credentials['SHEETS_API_URI'];
  String sheetId = sheets_credentials['SHEET_ID'];
  String url = '${sheetsApiUrl}/${sheetId}/values/Activity!A2:C?majorDimension=ROWS';

  final http.Response response = await http.get(url, headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer ${accessToken}',
  });

  List<dynamic> values = json.decode(response.body)['values'] as List;
  return values.map((row) => new HabitActivity.fromList(row)).toList();
}