import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_tawk/flutter_tawk.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
// import 'package:xyx_vendor/controller/httpController.dart';
// import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:http/http.dart' as http;

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  @override
  _HelpSupportScreenState createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  bool _progressVisible = false;
  bool chat = false;
  _data() async {
    try {
      faq.clear();
      setState(() {
        _progressVisible = true;
      });

      var data = await http.post(Uri.parse(getFaqUrl), body: {
        'token':
            '''\$2y\$10\$r.vc8Xw4WmAMXnB0uX3uo.mjqqAiJzKmZgYmxEkHxcY7CWau.HGuu''',
      });
      var dat = json.decode(data.body);
      // print('''\$2y\$10\$r.vc8Xw4WmAMXnB0uX3uo.mjqqAiJzKmZgYmxEkHxcY7CWau.HGuu''');

      if (dat.isNotEmpty) {
        print(dat);
        faq = dat;
      }
      setState(() {
        _progressVisible = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _data();
  }

  bool expanded = false;
  void setLoading(bool value) {
    setState(() {
      expanded = value;
    });
  }

  List<dynamic> faq = [];
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      progress: _progressVisible,
      appBar: AppBar(
        title: Text(
          "Help & Support",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "FAQs",
                    style: TextStyle(
                      color: Color(0xff252733),
                      fontSize: 14,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  ...List<Widget>.generate(faq.length, (i) {
                    return Container(
                        child: TitleWidget(
                      data: faq[i],
                    ));
                  }),
                  //  ...List<Widget>.generate(faq.length, (i) {
                  //   return Container(
                  //     height: 50,
                  //     child: titleWidget(faq[i]['question']));
                  // }),
                  // titleWidget(
                  //     "Amet minim mollit non deserunt ullamco est sit aliqua?"),
                  // titleWidget(
                  //     "Amet minim mollit non deserunt ullamco est sit aliqua?"),
                  // titleWidget("How do I use ZYX app to pay?"),
                  SizedBox(
                    height: 40,
                  ),
                  // if (chat)
                    // Tawk(
                    //   directChatLink: '',
                    //   visitor: TawkVisitor(),
                    // ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        chat = !chat;
                      });
                      print('tawk');
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xff523291),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "CHAT WITH US",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            color: Color(0xfffafafa),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Contact with us",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff313131),
                          fontFamily: "Inter",
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Demofy21",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Call us : +91 9999999999\nEmail us - info@demofy21.top \nAddress : Demofy21 office, Nagpur 440010",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Inter",
                          color: Color(0xff313131),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TitleWidget extends StatefulWidget {
  const TitleWidget({
    Key? key,
    this.data,
  }) : super(key: key);
  final dynamic data;
  @override
  _TitleWidgetState createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  bool expanded = false;
  void setLoading() {
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setLoading();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Color(0xffe7e7e7),
            width: 1,
          ),
          color: Colors.white,
        ),
        padding:
            const EdgeInsets.only(left: 20, right: 12, top: 10, bottom: 10),
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    widget.data['question']!, //"How do I use ZYX app to pay?",
                    style: TextStyle(
                      color: Color(0xff666666),
                      fontSize: 14,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    expanded ? Icons.expand_less : Icons.expand_more,
                    color: Color(0xff666666),
                  ),
                ),
              ],
            ),
            if (expanded)
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(thickness: 1),
              ),
            if (expanded)
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('-> '),
                      Flexible(
                        child: Text(
                          widget.data[
                              'answer']!, //"How do I use ZYX app to pay?",
                          style: TextStyle(
                            color: Color(0xff666666),
                            fontSize: 14,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
