import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xyx_vendor/Localizations/localization.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:xyx_vendor/screens/home/category/widget/menu_widget.dart';
import 'package:xyx_vendor/screens/home/store_screen/widget/image_selected_widget.dart';
import 'package:xyx_vendor/screens/home/store_screen/widget/image_selection_widget.dart';

class StoreImageScreen extends StatefulWidget {
  const StoreImageScreen({Key? key}) : super(key: key);

  @override
  _StoreImageScreenState createState() => _StoreImageScreenState();
}

class _StoreImageScreenState extends State<StoreImageScreen> {
  bool _progressVisible = false;
  ImagePicker _picker = ImagePicker();
  File? webLogo;
  File? appLogo;

  _imagePicker(int i) async {
    try {
      ImageSource? source = await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => ImageSourceMenuWidget(),
      );

      if (source == null) return;
      XFile? file = await _picker.pickImage(source: source);

      if (file != null) {
        if (i == 0) {
          webLogo = File(file.path);
        } else {
          appLogo = File(file.path);
        }
        setState(() {
          print(webLogo!.path);
        });
      }
    } catch (e) {
      print(e);
    }
  }



_updateStoreImage() async {
    try {
     
       if (webLogo == null|| appLogo ==null) {
        Fluttertoast.showToast(msg: 'Please select proper category image..!!');
        return;
      }

      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().multiPart(updateStoreImagesUrl, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'storeWebLogo':webLogo,
        'storeAppLogo':appLogo,
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        
        setState(() {
          webLogo = null;
          appLogo = null;
          
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
          "Change Store Images",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 20,
                spacing: 20,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imagePicker(0);
                    },
                    child: webLogo!=null?
                    ImageSelectedWidget(
                      imageSize: AppLocalizations.instance.text("390x140pxPNG"),
                      title: AppLocalizations.instance.text("uploadWebLogo"),
                      file: webLogo,)
                    : ImageSelectionWidget(
                      imageSize: AppLocalizations.instance.text("390x140pxPNG"),
                      title: AppLocalizations.instance.text("uploadWebLogo"),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                      _imagePicker(1);
                    },
                    child: appLogo!=null?
                    ImageSelectedWidget(
                      imageSize: AppLocalizations.instance.text("512x512pxPNG"),
                      title: AppLocalizations.instance.text("uploadAppLogo"),
                      file: appLogo,)
                    : ImageSelectionWidget(
                      imageSize: AppLocalizations.instance.text("512x512pxPNG"),
                      title: AppLocalizations.instance.text("uploadAppLogo"),
                    ),
                  ),
                  // ImageSelectionWidget(
                  //   imageSize:
                  //       AppLocalizations.instance.text("1300x700pxPNGimage"),
                  //   title: AppLocalizations.instance
                  //       .text("uploadFeaturedImg(Max4img)"),
                  // ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: _updateStoreImage,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff523291),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    // AppLocalizations.instance.text("update"),
                    "UPDATE",
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
      ),
    );
  }
}
