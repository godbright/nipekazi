import 'dart:convert';
import 'dart:io';
import 'package:get/utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  final String _url = 'https://admin.nihudumietz.co.tz/api/';
  String token = "";
  postData(data, apiUrl, [token]) async {
    var fullUrl = _url + apiUrl;
    if (token != null) {
      token = token!.value.replaceAll(RegExp(r'"'), '');
    }

    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders(token));
  }

  getData(apiUrl, [token]) async {
    var fullUrl = _url + apiUrl;

    if (token != null) {
      token = token!.value.replaceAll(RegExp(r'"'), '');
    }

    return await http.get(Uri.parse(fullUrl), headers: _setHeaders(token));
  }

  getScript(url, [token]) async {
    return await http.get(Uri.parse(url), headers: _setHeaders(token));
  }

  _setHeaders(token) => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
}
