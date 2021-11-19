import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:xyx_vendor/screens/home/category/widget/menu_widget.dart';
import 'package:xyx_vendor/screens/home/store_screen/widget/image_selected_widget.dart';
import 'package:xyx_vendor/screens/home/store_screen/widget/image_selection_widget.dart';

class AddCategoryScreen extends StatefulWidget {
  final bool edit;
  final String id;
  final Map? data;
  const AddCategoryScreen({
    Key? key,
    this.edit = false,
    this.id = '',
    this.data,
  }) : super(key: key);

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  bool _progressVisible = false;
  bool _networkImage = false;
  String networkImage = '';
  ImagePicker _picker = ImagePicker();
  File? sourceFile;
  TextEditingController _name = TextEditingController();

  _imagePicker() async {
    try {
      ImageSource? source = await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => ImageSourceMenuWidget(),
      );

      if (source == null) return;
      XFile? file = await _picker.pickImage(source: source);

      if (file != null) {
        sourceFile = File(file.path);
        _networkImage = false;
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  _create() async {
    try {
      var name = _name.text;

      if (name == '') {
        Fluttertoast.showToast(msg: 'Please fill all the fields..!!');
        return;
      } else if (sourceFile == null) {
        Fluttertoast.showToast(msg: 'Please select proper category image..!!');
        return;
      }

      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().multiPart(addCategoryUrl, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'categoryName': name,
        'categoryImage': sourceFile,
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        setState(() {
          sourceFile = null;
          _name.text = '';
        });
      }
    } catch (e) {
      print(e);
    }
  }

  _edit() async {
    try {
      var name = _name.text;

      if (name == '') {
        Fluttertoast.showToast(msg: 'Please fill all the fields..!!');
        return;
      } else if (sourceFile == null) {
        Fluttertoast.showToast(msg: 'Please select proper category image..!!');
        return;
      }

      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().multiPart(editCategoryUrl, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'categoryId': widget.id,
        'categoryName': name,
        'categoryImage': sourceFile,
      });
      setState(() {
        _progressVisible = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.edit && widget.data != null) {
      setState(() {
        _name.text = widget.data!['categoryName'];
        networkImage = widget.data!['categoryImage'];
        _networkImage = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      progress: _progressVisible,
      appBar: AppBar(
        title: Text(
          widget.edit ? "EDIT CATEGORY" : "Add Category",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: _imagePicker,
              child: sourceFile == null && !_networkImage
                  ? ImageSelectionWidget(
                      imageSize: "upload JPG, PNG",
                      title: "Add Category Image",
                    )
                  : ImageSelectedWidget(
                      imageSize: "upload JPG, PNG",
                      title: "Add Category Image",
                      file: sourceFile,
                      networkImage: _networkImage,
                      image: networkImage,
                    ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Name of Category",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AppEditTextField(
              hintStyle: "Enter here",
              controller: _name,
            ),
            Spacer(),
            GestureDetector(
              onTap: widget.edit ? _edit : _create,
              child: Container(
                width: 312,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff523291),
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.edit ? "EDIT CATEGORY" : "CREATE CATEGORY",
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
          ],
        ),
      ),
    );
  }
}
