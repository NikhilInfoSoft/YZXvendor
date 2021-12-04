import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class HttpController {
  Future<Map> get(String url, {Map? body, bool debug = false}) async {
    try {
      if (url == '') {
        Fluttertoast.showToast(msg: 'Url can\'t be empty..!!');
        return {};
      }
      if (body != null && body.isNotEmpty) {
        var keys = body.keys.toList();
        for (var i = 0; i < keys.length; i++) {
          if (i == 0) {
            url += '?';
          } else {
            url += '&';
          }

          url += keys[i] + '=' + body[keys[i]];
        }
      }
      print(url);
      var response = await http.get(Uri.parse(url));

      if (debug) {
        print(response.body);
      }
      if (response.statusCode != 200) {
        Map data = {};
        try {
          data = jsonDecode(response.body);
        } catch (e) {
          print(e);
        }
        if (data.containsKey('error')) {
          var errorText = '';
          if (data['error'] is Map) {
            var keys = data['error'].keys.toList();
            if (data['error'][keys[0]] is List) {
              errorText = data['error'][keys[0]][0].toString();
            } else {
              errorText = data['error'][keys[0]].toString();
            }
          } else {
            errorText = data['error'].toString();
          }

          Fluttertoast.showToast(msg: errorText.toString());
        } else {
          Fluttertoast.showToast(msg: 'Internal Server Error');
        }
      } else if (response.body != '') {
        Map data = jsonDecode(response.body);
        if (data.containsKey('message') && data['message'] != '') {
          Fluttertoast.showToast(msg: data['message']);
        }
        return data['status'] == 1 ? data : {};
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Server Returned Invalid Response');
    }

    return {};
  }

  Future<Map> post(String url, Map body, {bool debug = false}) async {
    try {
      if (url == '') {
        Fluttertoast.showToast(msg: 'Url can\'t be empty..!!');
        return {};
      }

      var response = await http.post(Uri.parse(url), body: body);
      if (debug) {
        print(response.body);
      }
      if (response.statusCode != 200) {
        Map data = {};
        try {
          data = jsonDecode(response.body);
        } catch (e) {
          print(e);
        }
        if (data.containsKey('error')) {
          var errorText = '';
          if (data['error'] is Map) {
            var keys = data['error'].keys.toList();
            if (data['error'][keys[0]] is List) {
              errorText = data['error'][keys[0]][0].toString();
            } else {
              errorText = data['error'][keys[0]].toString();
            }
          } else {
            errorText = data['error'].toString();
          }

          Fluttertoast.showToast(msg: errorText.toString());
        } else {
          Fluttertoast.showToast(msg: 'Internal Server Error');
        }
      } else if (response.body != '') {
        Map data = jsonDecode(response.body);
        if (data.containsKey('message') && data['message'] != '') {
          Fluttertoast.showToast(msg: data['message']);
        }
        return data['status'] == 1 ||
                data['status'] == 200 ||
                data['status'] == 0
            ? data
            : {};
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: 'Server Returned Invalid Response');
    }

    return {};
  }

  Future<Map> multiPart(String url, Map body, {bool debug = false}) async {
    try {
      if (url == '') {
        Fluttertoast.showToast(msg: 'Url can\'t be empty..!!');
        return {};
      }

      var request = http.MultipartRequest("POST", Uri.parse(url));
      for (var item in body.keys.toList()) {
        if (body[item] is File) {
          request.files.add(await http.MultipartFile.fromPath(
            item,
            body[item].path,
          ));
        } else {
          request.fields[item] = body[item];
        }
      }
      var stream = await request.send();
      var response = await http.Response.fromStream(stream);
      if (debug) {
        print(response.body);
      }
      if (response.statusCode != 200) {
        print(response.statusCode);
        print(response.body);
        Map data = {};
        try {
          data = jsonDecode(response.body);
        } catch (e) {
          print(e);
        }
        if (data.containsKey('error')) {
          var errorText = '';
          if (data['error'] is Map) {
            var keys = data['error'].keys.toList();
            if (data['error'][keys[0]] is List) {
              errorText = data['error'][keys[0]][0].toString();
            } else {
              errorText = data['error'][keys[0]].toString();
            }
          } else {
            errorText = data['error'].toString();
          }

          Fluttertoast.showToast(msg: errorText.toString());
        } else {
          Fluttertoast.showToast(msg: 'Internal Server Error');
        }
      } else if (response.body != '') {
        Map data = jsonDecode(response.body);
        print('http>>$data');
        if (data.containsKey('message') && data['message'] != '') {
          Fluttertoast.showToast(msg: data['message']);
        }
        return data['status'] == 1 ? data : {};
      }
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: 'Server Returned Invalid Response');
    }

    return {};
  }
}
