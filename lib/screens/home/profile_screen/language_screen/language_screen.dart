import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/screens/home/profile_screen/language_screen/model/language_model.dart';
import 'package:xyx_vendor/screens/home/profile_screen/language_screen/widget/language_widget.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Language",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: AppColors.primary,
              padding: EdgeInsets.symmetric(horizontal: 40).copyWith(top: 20),
              child: Image.asset("assets/icon/language_bg.png"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  for (var model in LanguageModel.list)
                    LanguageWidget(
                      icon: model.icon,
                      name: model.name,
                      isSelected: model.isSelected,
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
