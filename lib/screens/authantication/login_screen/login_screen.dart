import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xyx_vendor/Localizations/localization.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:xyx_vendor/screens/authantication/otp_screen/otp_sreen.dart';
import 'package:xyx_vendor/screens/authantication/sign_up_screen/signup_screen.dart';
import 'package:xyx_vendor/screens/authantication/splash_screen/splash_screen.dart';
import 'package:xyx_vendor/screens/home/home_screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _LoginDesign();
  }
}

class _LoginDesign extends StatefulWidget {
  const _LoginDesign({Key? key}) : super(key: key);

  @override
  _LoginDesignState createState() => _LoginDesignState();
}

class _LoginDesignState extends State<_LoginDesign> {
  bool _progressVisible = false;
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();

  _login() async {
    try {
      var mobile = _mobile.text;
      var password = _password.text;
      var countryCode = '+91';

      if (mobile == '' || password == '') {
        Fluttertoast.showToast(msg: 'Please fill all the fields..!!');
        return;
      }

      setState(() {
        _progressVisible = true;
      });
      Map data = await HttpController().post(loginUrl, {
        'vendorCountryCode': countryCode,
        'vendorContactNumber': mobile,
        'password': password,
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        if (data['status'] == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        }
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
                  widgetList['LoginTextWidget']!,
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
                        hintStyle: "xxx-xxx xxx-xxx",
                        keyboard: TextInputType.number,
                        controller: _mobile,
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
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OTPScreen(
                          vendorContactNumber: _mobile.text,
                          signup: false,
                        ),
                      ),
                    );
                  },
                  child: widgetList['ForgetPasswordWidget']),
              // widgetList['SizedBoxWidget']!,
              SizedBox(height: 50.86),
              Container(
                alignment: Alignment.center,
                child: GestureDetector(
                    onTap: _login,
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => OTPScreen(),
                    //     ),
                    //   );
                    // },
                    child: widgetList['LoginTextButtonWidget']),
              ),
              SizedBox(height: 26.86),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: widgetList['DontHaveAcc']),
            ],
          ),
        ),
      ),
    );
  }
}
