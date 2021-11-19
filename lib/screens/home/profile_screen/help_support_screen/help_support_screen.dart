import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  @override
  _HelpSupportScreenState createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
 bool _progressVisible=false;
  _data() async {
    try {
      // sponsoredPlanList.clear();
      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().post(getFaqUrl,{
        'token': '\$2y\$10\$r.vc8Xw4WmAMXnB0uX3uo.mjqqAiJzKmZgYmxEkHxcY7CWau.HGuu',
      });
      print(data);
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        print(data);
        // sponsoredPlanList = data['data'];
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _data();
  }
  
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
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
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
                    titleWidget("How do I use ZYX app to pay?"),
                    titleWidget("Amet minim mollit non deserunt ullamco est sit aliqua?"),
                    titleWidget("Amet minim mollit non deserunt ullamco est sit aliqua?"),
                    titleWidget("How do I use ZYX app to pay?"),
                    SizedBox(height: 40,),
                    Container(
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
                children:[
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
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
                        Text("Demofy21",textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),),
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
      ),
    );
  }

  Widget titleWidget(String text){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Color(0xffe7e7e7), width: 1, ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 20, right: 12,top: 10,bottom: 10 ),
      margin: const EdgeInsets.only(top: 10 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Flexible(
            child: Text(
              text,//"How do I use ZYX app to pay?",
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
              Icons.keyboard_arrow_right,
              color: Color(0xff666666),
            ),
          ),
        ],
      ),
    );
  }
}
