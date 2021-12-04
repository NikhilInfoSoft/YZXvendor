import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';

class PrintSettingScreen extends StatefulWidget {
  const PrintSettingScreen({Key? key}) : super(key: key);

  @override
  _PrintSettingScreenState createState() => _PrintSettingScreenState();
}

class _PrintSettingScreenState extends State<PrintSettingScreen> {
  TextEditingController _widthController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  List<String> printSetting = [];
  bool _progressVisible = false;

  _savePrintSetting() async {
    try {
      var width = _widthController.text;
      var height = _heightController.text;
      String finalPrintSetting = '';
      printSetting.forEach((element) {
        if (finalPrintSetting == '') {
          finalPrintSetting = element;
        } else {
          finalPrintSetting = finalPrintSetting + ',' + element;
        }
      });
      if (width == '' || height == '') {
        Fluttertoast.showToast(msg: 'Please enter valid data in fields..!!');
        return;
      }
     

      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser(); 
      print({
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'printSetting':finalPrintSetting,
        'printReceiptWidth': width,
        'printReceiptHeight': height,
      });
      Map data = await HttpController().post(setPrintSettingUrl, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'printSetting': finalPrintSetting,
        'printReceiptWidth': width,
        'printReceiptHeight': height,
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        setState(() {
          printSetting = [];
          _widthController.text = "";
          _heightController.text = "";
        });
      }
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
          "Print Settings",
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
          padding: EdgeInsets.symmetric(vertical: 20),
          children: [
            Row(
              children: [
                Checkbox(
                  value: printSetting.contains('Show Logo'),
                  onChanged: (value) {
                    if (!printSetting.contains('Show Logo')) {
                      setState(() {
                        printSetting.add('Show Logo');
                      });
                    } else {
                      setState(() {
                        printSetting.remove('Show Logo');
                      });
                    }
                  },
                  activeColor: AppColors.primary,
                ),
                Text(
                  "Show Logo",
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 12,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: printSetting.contains('Show Address'),
                  onChanged: (value) {
                    if (!printSetting.contains('Show Address')) {
                      setState(() {
                        printSetting.add('Show Address');
                      });
                    } else {
                      setState(() {
                        printSetting.remove('Show Address');
                      });
                    }
                  },
                  activeColor: AppColors.primary,
                ),
                Text(
                  "Show Address",
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 12,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: printSetting.contains('Show Tax Number'),
                  onChanged: (value) {
                    if (!printSetting.contains('Show Tax Number')) {
                      setState(() {
                        printSetting.add('Show Tax Number');
                      });
                    } else {
                      setState(() {
                        printSetting.remove('Show Tax Number');
                      });
                    }
                  },
                  activeColor: AppColors.primary,
                ),
                Text(
                  "Show Tax Number",
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 12,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Size of Receipt",
                    style: TextStyle(
                      color: Color(0xff666666),
                      fontSize: 14,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Width",
                            style: TextStyle(
                              color: Color(0xff666666),
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 9),
                          AppEditTextField(
                            controller: _widthController,
                            hintStyle: "Enter here",
                          )
                        ],
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Height",
                            style: TextStyle(
                              color: Color(0xff666666),
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 9),
                          AppEditTextField(
                            controller: _heightController,
                            hintStyle: "Enter here",
                          )
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: _savePrintSetting,
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
            )
          ],
        ),
      ),
    );
  }
}
