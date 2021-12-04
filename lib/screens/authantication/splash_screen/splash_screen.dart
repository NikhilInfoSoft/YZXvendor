import 'dart:async';
import 'dart:convert';

import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xyx_vendor/common/app_assets.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
// import 'package:xyx_vendor/screens/authantication/location_permission_screen/location_persmission_screen.dart';
import 'package:xyx_vendor/screens/authantication/login_screen/login_screen.dart';
// import 'package:xyx_vendor/screens/authantication/otp_screen/otp_sreen.dart';
import 'package:xyx_vendor/screens/home/home_screen/home_screen.dart';

// import 'package:xyx_vendor/screens/home/setting_screen/store_details/store_location_screen.dart';
// import 'package:xyx_vendor/screens/home/store_screen/create_store_screen.dart';

class DefaultClickListener implements ClickListener {
  @override
  void onClicked(String? event) {
    print("Receive click event: " + (event == null ? "" : event));
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SplashDesign();
  }
}

final List<Map<String, String>> listWidgetJson = [
  {
    'widgetName': 'AddNewSubCategoryWidget',
    'widget':
        '''{"type":"Container","alignment":"center","padding":"0.0,15.0,0.0,15.0","color":null,"margin":null,"constraints":null,"child":{"type":"Text","data":"Add New Sub Category","textAlign":"center","overflow":"ellipsis","maxLines":null,"semanticsLabel":null,"softWrap":null,"textDirection":"ltr","style":{"color":"ff523291","debugLabel":null,"decoration":"underline","fontSize":16.0,"fontFamily":"Inter","fontStyle":"normal","fontWeight":"w600"},"textScaleFactor":null}}''',
  },
  {
    'widgetName': 'AddNewProductWidget',
    'widget': '''
{"type":"ClipRRect","borderRadius":"8.0,8.0,8.0,8.0","clipBehavior":"antiAlias","child":{"type":"Container","alignment":"center","padding":null,"color":"ff523291","margin":null,"constraints":{"minWidth":222.0,"maxWidth":222.0,"minHeight":50.0,"maxHeight":50.0},"child":{"type":"Text","data":"ADD NEW PRODUCT","textAlign":"center","overflow":"ellipsis","maxLines":null,"semanticsLabel":null,"softWrap":null,"textDirection":"ltr","style":{"color":"ffffffff","debugLabel":null,"decoration":"none","fontSize":16.0,"fontFamily":"Inter","fontStyle":"normal","fontWeight":"w600"},"textScaleFactor":null}}}''',
  },
  {
    'widgetName': 'AddNewCategoryWidget',
    'widget': '''
{"type":"ClipRRect","borderRadius":"8.0,8.0,8.0,8.0","clipBehavior":"antiAlias","child":{"type":"Container","alignment":"center","padding":null,"color":"ff523291","margin":null,"constraints":{"minWidth":222.0,"maxWidth":222.0,"minHeight":50.0,"maxHeight":50.0},"child":{"type":"Text","data":"ADD NEW CATEGORY","textAlign":"center","overflow":"ellipsis","maxLines":null,"semanticsLabel":null,"softWrap":null,"textDirection":"ltr","style":{"color":"ffffffff","debugLabel":null,"decoration":"none","fontSize":16.0,"fontFamily":"Inter","fontStyle":"normal","fontWeight":"w600"},"textScaleFactor":null}}}''',
  },
  {
    'widgetName': '+91Text',
    'widget':
        '''{"type":"ClipRRect","borderRadius":"8.0,8.0,8.0,8.0","clipBehavior":"antiAlias","child":{"type":"Container","alignment":null,"padding":"0.0,16.0,0.0,15.0","color":"ff523291","margin":null,"constraints":{"minWidth":49.0,"maxWidth":49.0,"minHeight":50.0,"maxHeight":50.0},"child":{"type":"Row","crossAxisAlignment":"center","mainAxisAlignment":"center","mainAxisSize":"min","textBaseline":"ideographic","textDirection":null,"verticalDirection":"down","children":[{"type":"Text","data":"+91","textAlign":"start","overflow":"ellipsis","maxLines":null,"semanticsLabel":null,"softWrap":null,"textDirection":"ltr","style":{"color":"ffe5e5e5","debugLabel":null,"decoration":"none","fontSize":16.0,"fontFamily":"Inter","fontStyle":"normal","fontWeight":"w500"},"textScaleFactor":null}]}}}''',
  },
  {
    'widgetName': 'LoginTextButtonWidget',
    'widget': '''{"type":"ClipRRect",
        "borderRadius":"8.0,8.0,8.0,8.0",
        "clipBehavior":"antiAlias",
        "child":{
          "type":"Container",
          "alignment":null,
          "padding":"0.0,16.0,0.0,15.0",
          "color":"ff523291",
          "margin":null,
          "constraints":{
            "minWidth":288.0,
            "maxWidth":288.0,
            "minHeight":50.0,
            "maxHeight":50.0
            },"child":{
              "type":"Row",
              "crossAxisAlignment":"center",
              "mainAxisAlignment":"center",
              "mainAxisSize":"min",
              "textBaseline":"ideographic",
              "textDirection":null,"verticalDirection":"down","children":[{
                "type":"Text","data":"LOGIN","textAlign":"center","overflow":"ellipsis","maxLines":null,"semanticsLabel":null,"softWrap":null,"textDirection":"ltr","style":{"color":"ffffffff","debugLabel":null,"decoration":"none","fontSize":16.0,"fontFamily":"Inter","fontStyle":"normal","fontWeight":"w600"},"textScaleFactor":null}]}}}''',
  },
  {
    'widgetName': 'SignUpTextButtonWidget',
    'widget': '''{"type":"ClipRRect",
        "borderRadius":"8.0,8.0,8.0,8.0",
        "clipBehavior":"antiAlias",
        "child":{
          "type":"Container",
          "alignment":null,
          "padding":"0.0,16.0,0.0,15.0",
          "color":"ff523291",
          "margin":null,
          "constraints":{
            "minWidth":288.0,
            "maxWidth":288.0,
            "minHeight":50.0,
            "maxHeight":50.0
            },"child":{
              "type":"Row",
              "crossAxisAlignment":"center",
              "mainAxisAlignment":"center",
              "mainAxisSize":"min",
              "textBaseline":"ideographic",
              "textDirection":null,"verticalDirection":"down","children":[{
                "type":"Text","data":"Sign Up","textAlign":"center","overflow":"ellipsis","maxLines":null,"semanticsLabel":null,"softWrap":null,"textDirection":"ltr","style":{"color":"ffffffff","debugLabel":null,"decoration":"none","fontSize":16.0,"fontFamily":"Inter","fontStyle":"normal","fontWeight":"w600"},"textScaleFactor":null}]}}}''',
  },
  {
    'widgetName': 'AlreadyHaveAcc',
    'widget': '''{"type":"Container","alignment":"center",
        "padding":null,"color":null,"margin":null,
        "constraints":null,"child":{
          "type":"Text","data":"Already have an account?","textAlign":"center","overflow":"ellipsis","maxLines":null,"semanticsLabel":null,"softWrap":null,"textDirection":"ltr","style":{"color":"ff523291","debugLabel":null,"decoration":"none","fontSize":16.0,"fontFamily":"Inter","fontStyle":"normal","fontWeight":"w500"},"textScaleFactor":null}}''',
  },
  {
    'widgetName': 'DontHaveAcc',
    'widget': '''{"type":"Container","alignment":"center",
        "padding":null,"color":null,"margin":null,
        "constraints":null,"child":{
          "type":"Text","data":"I don’t have an account?","textAlign":"center","overflow":"ellipsis","maxLines":null,"semanticsLabel":null,"softWrap":null,"textDirection":"ltr","style":{"color":"ff523291","debugLabel":null,"decoration":"none","fontSize":16.0,"fontFamily":"Inter","fontStyle":"normal","fontWeight":"w500"},"textScaleFactor":null}}''',
  },
  {
    'widgetName': 'ForgetPasswordWidget',
    'widget':
        '''{"type":"Container","alignment":"centerRight","padding":null,"color":null,"margin":null,"constraints":null,"child":{"type":"Text","data":"Forget password?","textAlign":"start","overflow":"ellipsis","maxLines":null,"semanticsLabel":null,"softWrap":null,"textDirection":"ltr","style":{"color":"ffcf198c","debugLabel":null,"decoration":"underline","fontSize":14.0,"fontFamily":null,"fontStyle":"normal","fontWeight":"normal"},"textScaleFactor":null}}''',
  },
  {
    'widgetName': 'LoginTextWidget',
    'widget': '''
    {
    "type": "Text",
    "data": "Login",
    "textAlign": "start",
    "overflow": "ellipsis",
    "maxLines": null,
    "semanticsLabel": null,
    "softWrap": null,
    "textDirection": "ltr",
    "style": {
        "color": "ff111823",
        "debugLabel": null,
        "decoration": "none",
        "fontSize": 24.0,
        "fontFamily": "Inter",
        "fontStyle": "normal",
        "fontWeight": "w600"
    },
    "textScaleFactor": null
}
''',
  },
  {
    'widgetName': 'SignUpTextWidget',
    'widget': '''
    {
    "type": "Text",
    "data": "Sign Up",
    "textAlign": "start",
    "overflow": "ellipsis",
    "maxLines": null,
    "semanticsLabel": null,
    "softWrap": null,
    "textDirection": "ltr",
    "style": {
        "color": "ff111823",
        "debugLabel": null,
        "decoration": "none",
        "fontSize": 24.0,
        "fontFamily": "Inter",
        "fontStyle": "normal",
        "fontWeight": "w600"
    },
    "textScaleFactor": null
}
''',
  },
  {
    'widgetName': 'OtpVerifyButtonWidget',
    'widget':
        '''{"type":"ClipRRect","borderRadius":"8.0,8.0,8.0,8.0","clipBehavior":"antiAlias","child":{"type":"Container","alignment":null,"padding":null,"color":"ff523291","margin":null,"constraints":{"minWidth":190.0,"maxWidth":190.0,"minHeight":50.0,"maxHeight":50.0},"child":{"type":"Row","crossAxisAlignment":"center","mainAxisAlignment":"center","mainAxisSize":"min","textBaseline":"ideographic","textDirection":null,"verticalDirection":"down","children":[{"type":"Text","data":"Verify","textAlign":"center","overflow":"ellipsis","maxLines":null,"semanticsLabel":null,"softWrap":null,"textDirection":"ltr","style":{"color":"ffffffff","debugLabel":null,"decoration":"none","fontSize":16.0,"fontFamily":"Inter","fontStyle":"normal","fontWeight":"w600"},"textScaleFactor":null}]}}}''',
  },
  {
    'widgetName': 'ResendCodeTextWidget',
    'widget':
        '''{"type":"Text","data":"Resend code","textAlign":"center","overflow":"ellipsis","maxLines":null,"semanticsLabel":null,"softWrap":null,"textDirection":"ltr","style":{"color":"ffcf198c","debugLabel":null,"decoration":"none","fontSize":14.0,"fontFamily":null,"fontStyle":"normal","fontWeight":"normal"},"textScaleFactor":null}''',
  }
];

Map<String, Widget?> widgetList = {};

class _SplashDesign extends StatefulWidget {
  const _SplashDesign({Key? key}) : super(key: key);

  @override
  _SplashDesignState createState() => _SplashDesignState();
}

class _SplashDesignState extends State<_SplashDesign> {
  Timer? _timer;

  Future<Widget?> _buildWidget(String jsonString, BuildContext context) async {
    return DynamicWidgetBuilder.build(
        jsonString, context, new DefaultClickListener());
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) async {
      listWidgetJson.forEach((element) async {
        Widget? singleWidget = await _buildWidget(element['widget']!, context);
        widgetList.putIfAbsent(element['widgetName']!, () => singleWidget);
      });

      await SharedData().setLogged(true);
      await SharedData().setUser('5', '4425f3017c2d8ad088c143915bba9946');
      // await SharedData().logout();
      bool logged = await SharedData().checkLogged();

      if (logged) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppColors.gradientColor,
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Image.asset(AppAssets.whiteLogo),
        ),
      ),
    );
  }
}
