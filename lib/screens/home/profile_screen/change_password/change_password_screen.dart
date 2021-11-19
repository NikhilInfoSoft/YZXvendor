import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _progressVisible = false;
  TextEditingController _current = TextEditingController();
  TextEditingController _new = TextEditingController();
  TextEditingController _confirm = TextEditingController();

  _change() async {
    try {
      var current = _current.text;
      var newp = _new.text;
      var confirm = _confirm.text;

      if (current == '' || newp == '' || confirm == '') {
        Fluttertoast.showToast(msg: 'Please fill all the fields..!!');
        return;
      }

      var user = await SharedData().getUser();
      setState(() {
        _progressVisible = true;
      });
      Map data = await HttpController().get(changePasswordUrl, body: {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'currentPassword': current,
        'newPassword': newp,
        'confirmPassword': confirm,
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
        "Change Password",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: "Inter",
          fontWeight: FontWeight.w600,
        ),
      )),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Current Password",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
            AppEditTextField(
              hintStyle: "******",
              suffixIcon: Icon(
                Icons.remove_red_eye_outlined,
                color: Color(0xffd5d5d5),
              ),
              controller: _current,
              obscureText: true,
            ),
            SizedBox(height: 15),
            Text(
              "New Password",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
            AppEditTextField(
              hintStyle: "******",
              suffixIcon: Icon(
                Icons.remove_red_eye_outlined,
                color: Color(0xffd5d5d5),
              ),
              controller: _new,
              obscureText: true,
            ),
            SizedBox(height: 15),
            Text(
              "Confirm Password",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
            AppEditTextField(
              hintStyle: "******",
              suffixIcon: Icon(
                Icons.remove_red_eye_outlined,
                color: Color(0xffd5d5d5),
              ),
              controller: _confirm,
              obscureText: true,
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: _change,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff523291),
                ),
                alignment: Alignment.center,
                child: Text(
                  "SAVE",
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
