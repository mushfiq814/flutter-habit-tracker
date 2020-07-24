import 'dart:convert';
import 'dart:io';
import 'package:habit_tracker/.config/.credentials.dart';
import 'package:habit_tracker/models/Habit.dart';
import 'package:http/http.dart' as http;

Future<List<Habit>> getHabits(String accessToken) async {
  String sheetsApiUrl = sheets_credentials['SHEETS_API_URI'];
  String sheetId = sheets_credentials['SHEET_ID'];
  String url = '${sheetsApiUrl}/${sheetId}/values/Habit!A2:B?majorDimension=ROWS';

  final http.Response response = await http.get(url, headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer ${accessToken}',
  });

  List<dynamic> values = json.decode(response.body)['values'] as List;
  print(values);
  return values.map((row) => new Habit.fromList(row)).toList();
}