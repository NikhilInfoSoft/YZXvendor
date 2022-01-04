import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xyx_vendor/Localizations/localization.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:xyx_vendor/screens/authantication/otp_screen/otp_screen.dart';
import 'package:xyx_vendor/screens/authantication/splash_screen/splash_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SignUpDesign();
  }
}

class _SignUpDesign extends StatefulWidget {
  const _SignUpDesign({Key? key}) : super(key: key);

  @override
  _SignUpDesignState createState() => _SignUpDesignState();
}

class _SignUpDesignState extends State<_SignUpDesign> {
  bool _progressVisible = false;
  TextEditingController _name = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();

  _signup() async {
    try {
      var name = _name.text;
      var mobile = _mobile.text;
      var password = _password.text;
      var countryCode = '+91';

      if (name == '' || mobile == '' || password == '') {
        Fluttertoast.showToast(msg: 'Please fill all the fields..!!');
        return;
      }

      setState(() {
        _progressVisible = true;
      });
      Map data = await HttpController().post(signUpUrl, {
        'vendorName': name,
        'vendorCountryCode': countryCode,
        'vendorContactNumber': mobile,
        'password': password,
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        data = data['response'];
        var vendorId = data['vendorId'];
        var vendorOtp = data['vendorOtp'];
        var vendorToken = data['vendorToken'];

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OTPScreen(
              signup: true,
              vendorId: vendorId.toString(),
              vendorOtp: vendorOtp.toString(),
              vendorToken: vendorToken.toString(),
            ),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      progress: _progressVisible,
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 28, left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  widgetList['SignUpTextWidget']!,
                  Spacer(),
                  Container(
                    width: 89.95,
                    height: 32,
                    child: FlutterLogo(size: 32),
                  ),
                ],
              ),
              SizedBox(height: 26.86),
              Container(
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xff523291), Color(0xffcf198c)],
                  ),
                ),
              ),
              SizedBox(height: 50.86),
              Text(
                AppLocalizations.instance.text("yourName"),
                // "Password",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                child: AppEditTextField(
                  hintStyle: "Jon x",
                  controller: _name,
                ),
              ),
              SizedBox(height: 10),
              Text(
                AppLocalizations.instance.text("phoneNumber"),
                // "Phone number",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    widgetList['+91Text']!,
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: AppEditTextField(
                        hintStyle: "xxx-xxx xx-xx",
                        controller: _mobile,
                        keyboard: TextInputType.number,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 26.86),
              Text(
                AppLocalizations.instance.text("password"),
                // "Password",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 8),
              AppEditTextField(
                hintStyle: "******",
                controller: _password,
                obscureText: true,
              ),
              SizedBox(height: 10),
              SizedBox(height: 50.86),
              Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    _signup();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => OTPScreen(),
                    //   ),
                    // );
                  },
                  child: widgetList['SignUpTextButtonWidget']
                ),
              ),
              SizedBox(height: 26.86),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: widgetList['AlreadyHaveAcc']
              ),
            ],
          ),
        ),
      ),
    );
  }
}
