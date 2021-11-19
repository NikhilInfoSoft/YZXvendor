import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xyx_vendor/Localizations/localization.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:xyx_vendor/screens/home/store_screen/store_location_screen.dart';
import 'package:xyx_vendor/screens/home/store_screen/widget/image_selection_widget.dart';

import 'widget/store_progress_widget.dart';

class CreateStoreScreen extends StatelessWidget {
  final bool create;
  const CreateStoreScreen({Key? key, this.create = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CreateStoreDesign(create: create);
  }
}

class _CreateStoreDesign extends StatefulWidget {
  final bool create;
  const _CreateStoreDesign({Key? key, this.create = false}) : super(key: key);

  @override
  _CreateStoreDesignState createState() => _CreateStoreDesignState();
}

class _CreateStoreDesignState extends State<_CreateStoreDesign> {
  var isListingOnZyx = false;
  bool _progressVisible = false;
  TextEditingController _name = TextEditingController();
  TextEditingController _gst = TextEditingController();
  late File webLogo;
  late File appLogo;

  _create() async {
    try {
      var name = _name.text;
      var gst = _gst.text;

      if (name == '' || gst == '' || webLogo == null || appLogo == null) {
        Fluttertoast.showToast(msg: 'All Fields is required..!!');
        return;
      }

      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().multiPart(saveStoreInfoUrl, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'storeName': name,
        'gstNumber': gst,
        'storeWebLogo': webLogo,
        'storeAppLogo': appLogo,
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        if (widget.create) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => StoreLocationScreen(create: true),
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
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            StoreProgressWidget(
              index: 1,
            ),
            Text(
              AppLocalizations.instance.text("storeInfo"),
              // "Store info",
              style: TextStyle(
                color: Color(0xff111823),
                fontSize: 24,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Text(
              AppLocalizations.instance.text("storeName"),
              // "store name",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            AppEditTextField(
              hintStyle: "NewLand",
              controller: _name,
            ),
            SizedBox(height: 10),
            Text(
              AppLocalizations.instance.text("gstNumber"),
              // "GST Number",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            AppEditTextField(
              hintStyle: "22xxxxxxxxxxxz5",
              controller: _gst,
            ),
            SizedBox(height: 30),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 10,
              children: [
                ImageSelectionWidget(
                  imageSize: AppLocalizations.instance.text("390x140pxPNG"),
                  title: AppLocalizations.instance.text("uploadWebLogo"),
                ),
                ImageSelectionWidget(
                  imageSize: AppLocalizations.instance.text("512x512pxPNG"),
                  title: AppLocalizations.instance.text("uploadAppLogo"),
                ),
                // ImageSelectionWidget(
                //   imageSize:
                //       AppLocalizations.instance.text("1300x700pxPNGimage"),
                //   title: AppLocalizations.instance
                //       .text("uploadFeaturedImg(Max4img)"),
                // ),
              ],
            ),
            // Row(
            //   children: [
            //     Text(
            //       AppLocalizations.instance.text("listingOnZyxApp"),
            //       // "Listing on Zyx App",
            //       style: TextStyle(
            //         color: Color(0xff111823),
            //         fontSize: 12,
            //         fontFamily: "Inter",
            //         fontWeight: FontWeight.w500,
            //       ),
            //     ),
            //     Spacer(),
            //     Switch(
            //       value: isListingOnZyx,
            //       activeColor: AppColors.primary,
            //       onChanged: (value) {
            //         setState(() {
            //           isListingOnZyx = !isListingOnZyx;
            //         });
            //       },
            //     ),
            //   ],
            // ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: _create,
              child: Container(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff523291),
                  ),
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 15, left: 20, right: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.instance.text("next"),
                        // "NEXT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
