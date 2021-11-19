import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';

class DeliveryDistanceScreen extends StatefulWidget {
  const DeliveryDistanceScreen({Key? key}) : super(key: key);

  @override
  _DeliveryDistanceScreenState createState() => _DeliveryDistanceScreenState();
}

class _DeliveryDistanceScreenState extends State<DeliveryDistanceScreen> {
  bool _progressVisible = false;
  TextEditingController _distance = TextEditingController();

  _update() async {
    try {
      var distance = _distance.text;
      if (distance == '') {
        Fluttertoast.showToast(msg: 'Please fill all the fields..!!');
        return;
      }

      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().post(setDeliveryDistanceUrl, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'deliveryDistance': distance,
      });
      setState(() {
        _progressVisible = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      progress: _progressVisible,
      appBar: AppBar(
        title: Text(
          "Delivery Distance",
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
          padding: EdgeInsets.all(20),
          shrinkWrap: true,
          children: [
            Text(
              "Default delivery distance configured by admin is displayed below. You can define their own delivery distance. ",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Configure Delivery Distance",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AppEditTextField(
              hintStyle: "25 km",
              controller: _distance,
              keyboard: TextInputType.number,
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: _update,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff523291),
                ),
                alignment: Alignment.center,
                child: Text(
                  "SAVE & UPDATE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
