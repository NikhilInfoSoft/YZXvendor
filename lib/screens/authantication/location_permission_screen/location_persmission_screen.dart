import 'package:flutter/material.dart';
import 'package:xyx_vendor/Localizations/localization.dart';
import 'package:xyx_vendor/common/app_assets.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/screens/authantication/login_screen/login_screen.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _LocationPermissionDesign();
  }
}

class _LocationPermissionDesign extends StatefulWidget {
  const _LocationPermissionDesign({Key? key}) : super(key: key);

  @override
  _LocationPermissionDesignState createState() =>
      _LocationPermissionDesignState();
}

class _LocationPermissionDesignState extends State<_LocationPermissionDesign> {
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
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.bgGry,
              borderRadius: BorderRadius.circular(18),
            ),
            margin: EdgeInsets.symmetric(horizontal: 40),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  AppAssets.locationIcon,
                  height: 50,
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  AppLocalizations.instance.text('locationPermissionText'),
                  // "ZYX needs permission to access location data once from user. User must allow to continue.",
                  style: TextStyle(fontSize: 14, color: Color(0xff666666)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      AppLocalizations.instance.text('allow').toUpperCase(),
                      //'ALLOW',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
