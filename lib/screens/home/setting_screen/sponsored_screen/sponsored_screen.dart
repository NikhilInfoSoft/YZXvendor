import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:xyx_vendor/screens/home/setting_screen/sponsored_screen/widget/plan_card_widget.dart';

import 'widget/invoices_card_widget.dart';

class SponsoredScreen extends StatefulWidget {
  const SponsoredScreen({Key? key}) : super(key: key);

  @override
  _SponsoredScreenState createState() => _SponsoredScreenState();
}

class _SponsoredScreenState extends State<SponsoredScreen> {

bool _progressVisible =false;
  List sponsoredPlanList = [];
 _data() async {
    try {
      sponsoredPlanList.clear();
      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().post(getVendorSponsoredPlansUrl,{
        'token': '\$2y\$10\$r.vc8Xw4WmAMXnB0uX3uo.mjqqAiJzKmZgYmxEkHxcY7CWau.HGuu'
      
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        print(data);
        sponsoredPlanList = data['data'];
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
      progress:_progressVisible,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Sponsored & Featured",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              color: Color(0xff523291),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your Store is",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sponsored & Featured",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20).copyWith(bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          "Invoices",
                          style: TextStyle(
                            color: Color(0xff252733),
                            fontSize: 14,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "View All",
                          style: TextStyle(
                            color: Color(0xff523291),
                            fontSize: 14,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InvoicesCardWidget(),
                        InvoicesCardWidget(),
                        InvoicesCardWidget(),
                        InvoicesCardWidget(),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Plans",
                      style: TextStyle(
                        color: Color(0xff252733),
                        fontSize: 14,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  sponsoredPlanList.length<=0 ? Center(child: Text('No plans fetched')): SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: 
                      
                     List<Widget>.generate(sponsoredPlanList.length,(int index){
                        return PlanCardWidget();
                      })
                     
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
}



