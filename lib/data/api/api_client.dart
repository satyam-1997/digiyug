import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'api_constant.dart';

class ApiCalls {
  var client = http.Client();

  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var response = await client.get(url, headers: _headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      // throw exception and catch it in UI
      Fluttertoast.showToast(
        msg: "Server Error ...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
    }
  }

  // post request
  Future<dynamic> post(String api, Map<String, String> data) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(data);
    var _headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    print("url is :${url}${_payload}");
    var response = await client.post(url, body: _payload, headers: _headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      Fluttertoast.showToast(
        msg: "Server Error ...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
    }
  }

  // put request
  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse("baseUrl" + api);

    var _payload = json.encode(object);
    var _headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var response = await client.put(url, body: _payload, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  // delete request
  Future<dynamic> delete(String api) async {
    var url = Uri.parse("baseUrl" + api);
    var _headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "x-digital-api-key": "1234",
      // "Authorization": "Bearer " + SPUtil.getString(SPKeys.ACCESS_TOKEN)
    };

    var response = await client.delete(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> postForRefreshToken(
      String api, Map<String, String> data) async {
    var url = Uri.parse("baseUrl" + api);
    var _payload = json.encode(data);
    var _headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "x-digital-api-key": "1234",
    };

    var response = await client.post(url, body: _payload, headers: _headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else if (response.statusCode == 401) {
    } else {
      Fluttertoast.showToast(
        msg: "Server Error ...",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
    }
  }
}
