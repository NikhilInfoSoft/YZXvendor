import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
// import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:http/http.dart' as http;

class ChatWebView extends StatefulWidget {
  const ChatWebView({Key? key}) : super(key: key);

  @override
  State<ChatWebView> createState() => _ChatWebViewState();
}

class _ChatWebViewState extends State<ChatWebView> {
  String? url;
  _data() async {
    try {
      setState(() {
        _progressVisible = true;
      });

      var res = await http.post(Uri.parse(getMessengerSettingsUrl), body: {
        'token':
            '''\$2y\$10\$r.vc8Xw4WmAMXnB0uX3uo.mjqqAiJzKmZgYmxEkHxcY7CWau.HGuu''',
      });
      var data = json.decode(res.body);
      if (data.isNotEmpty) {
        print(data);
        url = data['vendorSiteLink'];
      }
      setState(() {
        _progressVisible = false;
      });
      print(url);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    _data();

    super.initState();
  }

  bool _progressVisible = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: AppBar(
          title: Text('Chat with us'),
        ),
        progress: _progressVisible,
        child: _progressVisible
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.black,
                  strokeWidth: 3,
                ),
              )
            : Center(
                child: WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: url,
                ),
              ));
  }
}
