import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';

class PreOrderSettingScreen extends StatefulWidget {
  const PreOrderSettingScreen({Key? key}) : super(key: key);

  @override
  _PreOrderSettingScreenState createState() => _PreOrderSettingScreenState();
}

class _PreOrderSettingScreenState extends State<PreOrderSettingScreen> {
  var isEnableProModel = true;
  bool _progressVisible = false;

  _update() async {
    try {
      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
     await HttpController().post(updatePreOrderStatusUrl, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'isPreOrder': isEnableProModel ? '1' : '0',
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
          "Pre Order",
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
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Enable Pre-orders - if pre order is enabled, users can book orders for delivery on next day.",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Enable Pre Order",
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Switch(
                  value: isEnableProModel,
                  onChanged: (value) {
                    setState(() {
                      isEnableProModel = !isEnableProModel;
                    });
                  },
                  activeColor: AppColors.primary,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: _update,
              child: Container(
                width: 312,
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
            ),
          ],
        ),
      ),
    );
  }
}
