import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:xyx_vendor/Localizations/localization.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:xyx_vendor/screens/authantication/splash_screen/splash_screen.dart';
import 'package:xyx_vendor/screens/home/store_screen/create_store_screen.dart';

class OTPScreen extends StatelessWidget {
  final bool signup;
  final String vendorId;
  final String vendorToken;
  final String vendorOtp;
  final String vendorContactNumber;
  const OTPScreen({
    Key? key,
    this.signup = false,
    this.vendorId = '',
    this.vendorToken = '',
    this.vendorContactNumber='',
    this.vendorOtp = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _OTPDesign(
      signup: signup,
      vendorId: vendorId,
      vendorOtp: vendorOtp,
      vendorToken: vendorToken,
      vendorContactNumber:vendorContactNumber,
    );
  }
}

class _OTPDesign extends StatefulWidget {
  final bool signup;
  final String vendorId;
  final String vendorToken;
  final String vendorContactNumber;
  final String vendorOtp;
  const _OTPDesign({
    Key? key,
    this.signup = false,
    this.vendorContactNumber='',
    this.vendorId = '',
    this.vendorToken = '',
    this.vendorOtp = '',
  }) : super(key: key);

  @override
  _OTPDesignState createState() => _OTPDesignState();
}

class _OTPDesignState extends State<_OTPDesign> {
  bool _progressVisible = false;
  TextEditingController _pin = TextEditingController();

  _verify() async {
    try {
      var otp = _pin.text;

      if (otp == '' || otp.length != 4) {
        Fluttertoast.showToast(msg: 'Please Enter Valid OTP');
        return;
      }

      setState(() {
        _progressVisible = true;
      });
      Map data = await HttpController().post(otpVerificationUrl, {
        'vendorId': widget.vendorId,
        'vendorToken': widget.vendorToken,
        'vendorOtp': otp,
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty && data['status'] == 1) {
        if (widget.signup) {
          if (await SharedData().setLogged(true) &&
              await SharedData().setUser(
                widget.vendorId.toString(),
                widget.vendorToken.toString(),
              )) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => CreateStoreScreen(),
              ),
              (route) => false,
            );
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

_resendOtp() async {
    try {
    
      setState(() {
        _progressVisible = true;
      });
      Map data = await HttpController().post(vendorotpUrl, {
        'vendorContactNumber':widget.vendorContactNumber,
        'vendorCountryCode':'+91',
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty && data['status'] == 1) {
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Verification code send"),
                ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("An error occurred"),
                ));
      print(e);
    }
  }






@override
  void initState() {
    _resendOtp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      progress: _progressVisible,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_outlined,
            color: AppColors.black,
          ),
        ),
      ),
      child: Container(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 30),
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: PinCodeTextField(
                controller: _pin,
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
                length: 4,
                obscureText: false,
                obscuringCharacter: '*',
                animationType: AnimationType.fade,
                validator: (v) {},
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 60,
                  fieldWidth: 50,
                  borderWidth: 1,
                  inactiveColor: Color(0xfff6f6f6),
                  inactiveFillColor: Color(0xfff6f6f6),
                  selectedColor: Colors.grey.withOpacity(0.5),
                  selectedFillColor: Colors.grey.withOpacity(0.5),
                  activeColor: Color(0xfff6f6f6),
                  activeFillColor: Color(0xfff6f6f6),
                  errorBorderColor: Color(0xffe7e7e7),
                ),
                cursorColor: Colors.black,
                animationDuration: Duration(milliseconds: 300),
                textStyle: TextStyle(fontSize: 20, height: 1.6),
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                boxShadows: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 1,
                  )
                ],
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                  setState(() {});
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  return true;
                },
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              AppLocalizations.instance.text("verificationCode"),
              // "Verification  code ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff111823),
                fontSize: 24,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              width: 182,
              height: 34,
              child: Text(
                AppLocalizations.instance
                    .text("verificationCode")
                    .replaceFirst("#NUMBER", "+91 *** *** **84"),
                // "Enter the OTP we send to +91 xxx-xx-x35 in sms",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              width: 190,
              height: 50,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor: Colors.transparent,
                              child: Container(
                                width: 232,
                                height: 320,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 232,
                                      height: 320,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        color: Color(0xffe5e5e5),
                                      ),
                                      padding: const EdgeInsets.only(
                                        top: 39,
                                        bottom: 22,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 46,
                                            height: 46,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 1,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 46,
                                                  height: 43.76,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 46,
                                                        height: 43.76,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 15,
                                                          bottom: 14,
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            Positioned.fill(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        19.57,
                                                                    height:
                                                                        14.73,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                    child: FlutterLogo(
                                                                        size:
                                                                            14.73160171508789),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Positioned.fill(
                                                              child: FlutterLogo(
                                                                  size:
                                                                      43.76249694824219),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 23),
                                          Text(
                                            AppLocalizations.instance
                                                .text("verified"),
                                            // "Verified",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xffcf198c),
                                              fontSize: 24,
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 23),
                                          SizedBox(
                                            width: 182,
                                            height: 65,
                                            child: Text(
                                              AppLocalizations.instance
                                                  .text("verifiedDescription"),
                                              // "You have been signed in successfully, lets create your store and start building your products",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xff666666),
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 23),
                                          Container(
                                            width: 190,
                                            height: 50,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 190,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    color: Color(0xff523291),
                                                  ),
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 76,
                                                    right: 75,
                                                    top: 16,
                                                    bottom: 15,
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        AppLocalizations
                                                            .instance
                                                            .text("start"),
                                                        // "Start",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontFamily: "Inter",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    child: GestureDetector(
                      onTap: _verify,
                      child: widgetList['OtpVerifyButtonWidget']
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
              _resendOtp();
             
              },
              child: widgetList['ResendCodeTextWidget'],
            )
          ],
        ),
      ),
    );
  }
}
