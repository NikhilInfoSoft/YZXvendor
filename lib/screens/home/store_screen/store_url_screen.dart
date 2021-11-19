import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/screens/home/store_screen/widget/store_progress_widget.dart';

class StoreUrlScreen extends StatelessWidget {
  const StoreUrlScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _StoreUrlDesign();
  }
}

class _StoreUrlDesign extends StatefulWidget {
  const _StoreUrlDesign({Key? key}) : super(key: key);

  @override
  _StoreUrlDesignState createState() => _StoreUrlDesignState();
}

class _StoreUrlDesignState extends State<_StoreUrlDesign> {
  String selectedRadio = "";

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Container(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            StoreProgressWidget(
              index: 2,
            ),
            Text(
              "URL",
              style: TextStyle(
                color: Color(0xff111823),
                fontSize: 24,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Radio(
                  value: selectedRadio,
                  groupValue: "test",
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = "test";
                    });
                  },
                ),
                Text(
                  "Choose a Subdomain",
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 14,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: AppEditTextField(
                    hintStyle: "Search",
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color(0xffe7e7e7),
                      width: 1,
                    ),
                    color: Color(0xff523291),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Check\nAvailability",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Congratulations : vendor.zyx.com is available! ",
              style: TextStyle(
                color: Color(0xff121923),
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff523291),
              ),
              child: Center(
                child: Text(
                  "LAUNCH MY ZYX STORE",
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
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Radio(
                  value: selectedRadio,
                  groupValue: "test",
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = "test";
                    });
                  },
                ),
                Text(
                  "Use own domain registered elsewhere",
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 14,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "New URL",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
            AppEditTextField(
              hintStyle: "(Enter Subdomain).zyx.com",
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff523291),
              ),
              child: Center(
                child: Text(
                  "USE MY DOMAIN",
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
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Inter",
                      color: Color(0xff666666)),
                  children: [
                    TextSpan(text: "Please update below nameservers :\n"),
                    TextSpan(
                      text: "nns1.zyx.com\n",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Inter",
                        color: Color(0xff121923),
                      ),
                    ),
                    TextSpan(
                      text: "nns2.zyx.com\n",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Inter",
                        color: Color(0xff121923),
                      ),
                    ),
                    TextSpan(
                        text: "Create A record for www and @ with below IP\n"),
                    TextSpan(
                      text: "1.1.1.1",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Inter",
                        color: Color(0xff121923),
                      ),
                    ),
                  ]),
            ),
            Row(
              children: [
                Radio(
                  value: selectedRadio,
                  groupValue: "test",
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = "test";
                    });
                  },
                ),
                Text(
                  "Register a Domain",
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 14,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Search Domain",
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 12,
                        ),
                      ),
                      AppEditTextField(
                        hintStyle: "Enter here",
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Extension",
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 12,
                        ),
                      ),
                      AppEditTextField(
                        hintStyle: ".com",
                      ),

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff523291),
              ),
              child: Center(
                child: Text(
                  "CHECK AVAILABILITY",
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
