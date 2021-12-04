import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xyx_vendor/common/widget/app_droupdown_widget.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:xyx_vendor/screens/home/category/widget/menu_widget.dart';
import 'package:xyx_vendor/screens/home/store_screen/widget/image_selected_widget.dart';
import 'package:xyx_vendor/screens/home/store_screen/widget/image_selection_widget.dart';
import 'package:http/http.dart' as http;

class AddSubCategoryScreen extends StatefulWidget {
  final List categoryList;
  final bool edit;
  final String id;
  final Map? data;
  const AddSubCategoryScreen({
    Key? key,
    required this.edit,
    required this.categoryList,
    this.id = '',
    this.data,
  }) : super(key: key);

  @override
  _AddSubCategoryScreenState createState() => _AddSubCategoryScreenState();
}

class _AddSubCategoryScreenState extends State<AddSubCategoryScreen> {
  String? _choosen;
  bool _progressVisible = false;
  ImagePicker _picker = ImagePicker();
  File? sourceFile;
  String? _subCategory;
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
        setState(() {});
      }
    } catch (e) {
      print(e);
    }
  }

  _create() async {
    try {
      var name = _name.text;
      int _category = 0;
      for (var item in widget.categoryList) {
        if (item['categoryName'] == _choosen) _category = item['categoryId'];
      }
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
      Map data = await HttpController().multiPart(addSubCategoryUrl, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'categoryId': _category.toString(),
        'subCategoryName': name,
        'subCategoryImage': sourceFile,
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

  _update() async {
    try {
      var name = _name.text;
      int _category = 0;
      for (var item in widget.categoryList) {
        if (item['categoryName'] == _choosen) _category = item['categoryId'];
      }
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
      Map data = await HttpController().multiPart(updateSubCategoryUrl, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'subCategoryId': widget.id,
        'categoryId': _category.toString(),
        'subCategoryName': name,
        'subCategoryImage': sourceFile,
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

  Future<void> urlToFile(String imageUrl) async {
    setState(() {
      _progressVisible = true;
    });
    var rng = new Random();
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File file = new File('$tempPath' + (rng.nextInt(100)).toString() + '.jpg');
    http.Response response = await http.get(Uri.parse(imageUrl));

    await file.writeAsBytes(response.bodyBytes);

    setState(() {
      _progressVisible = false;
      _name.text = widget.data!['subCategoryName'];
      sourceFile = file;
      _choosen = widget.data!['category'];
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.edit && widget.data != null) {
      urlToFile(widget.data!['subCategoryImage']);
    } else {
      _choosen = widget.categoryList.first['categoryName'];
    }

    print(widget.categoryList);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      progress: _progressVisible,
      appBar: AppBar(
        title: Text(
          widget.edit ? "Edit Sub-Category" : "Add Sub-Category",
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
              child: sourceFile == null
                  ? ImageSelectionWidget(
                      imageSize: "upload JPG, PNG",
                      title: "Add Category Image",
                    )
                  : ImageSelectedWidget(
                      imageSize: "upload JPG, PNG",
                      title: "Add Category Image",
                      file: sourceFile,
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
            AppDropDownWidget(
              hint: '',
              list: List.generate(widget.categoryList.length, (index) {
                print(_choosen);
                return widget.categoryList[index]['categoryName'];
              }),
              chosen: _choosen,
              changeChosen: (value) {
                print(value);
                setState(() {
                  _choosen = value;
                });
              },
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Name of Sub-Category",
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
              onTap: widget.edit ? _update : _create,
              child: Container(
                width: 312,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff523291),
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.edit ? "UPDATE SUB CATEGORY" : "CREATE SUB CATEGORY",
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
