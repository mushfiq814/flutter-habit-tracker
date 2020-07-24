import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:habit_tracker/.config/.credentials.dart';

Future<String> appendToSheet(String accessToken) async {
  String sheetsApiUrl = sheets_credentials['SHEETS_API_URI'];
  String sheetId = sheets_credentials['SHEET_ID'];
  String url = '${sheetsApiUrl}/${sheetId}/values/Sheet1!A1:B1:append?valueInputOption=USER_ENTERED';

  dynamic bodyData = {
    'majorDimension': 'ROWS',
    'values': [
      [
        6,
        'Bird',
        'Birdland',
        'james@bird.com'
      ]
    ]
  };

  final http.Response response = await http.post(url, headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer ${accessToken}',
  }, body: json.encode(bodyData));

  return response.body;
}