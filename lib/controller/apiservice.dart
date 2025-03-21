// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import '../core/helpers/help_toast.dart';
import '../utils/core/helpers/help_toast.dart';
import 'api/urls.dart';

enum Method { get, post, put, delete }

class Api {
  static const _headers = {'Content-Type': 'application/json'};

  static Future? call(BuildContext context, {required String endPoint, required Method method, Object? body}) async {
    try {
      final http.Response response;
      log("${baseurl + endPoint} ($method)\n$body");

      //REST API METHOD
      switch (method) {
        case Method.get:
          String url = baseurl + endPoint;
          response = await http.get(Uri.parse(url), headers: _headers);
          log(response.body);

          try {
            final data = response.body;
            return data;
          } catch (err) {
            rethrow;
          }

        case Method.post:
          log( json.encode(body));
          response = await http.post(Uri.parse(baseurl + endPoint), body: json.encode(body), headers: _headers);
          log(response.body);
           var data;
          try {
            if (response.statusCode ==200) {
               data =response.body;
            }else{
              data = {
                "error":true,
                "msg":"Server Down"
              };
            }
            return data;
          } catch (err) {
            rethrow;
          }

        case Method.put:
          response = await http.put(Uri.parse(baseurl + endPoint), body: json.encode(body), headers: _headers);
          log(response.body);
          try {
            final data = response.body;
            return data;
          } catch (err) {
            rethrow;
          }
        default:
          return null;
      }
    } on SocketException {
      
      snackBar(context, message: "Network seems to be offline", type: MessageType.error);
      return null;
    } catch (e) {
     
      snackBar(context, message: e.toString());
      debugPrint("$e");
      return null;
    }
  }
}
