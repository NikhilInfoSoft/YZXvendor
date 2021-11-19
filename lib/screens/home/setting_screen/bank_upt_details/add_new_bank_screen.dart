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

class AddNewBankScreen extends StatefulWidget {
  const AddNewBankScreen({Key? key}) : super(key: key);

  @override
  _AddNewBankScreenState createState() => _AddNewBankScreenState();
}

class _AddNewBankScreenState extends State<AddNewBankScreen> {
  TextEditingController _payeeNameController = TextEditingController();
  TextEditingController _accController = TextEditingController();
  TextEditingController _ifscController = TextEditingController();
  TextEditingController _bankNameController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  ImagePicker _picker = ImagePicker();
  File? sourceFile;
  bool _progressVisible = false;
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

  _addBank() async {
    try {
      var payeeName = _payeeNameController.text;
      var accountNo = _accController.text;
      var ifsc = _ifscController.text;
      var bankName = _bankNameController.text;
      var city = _cityController.text;

      if (payeeName == '' ||
          accountNo == '' ||
          ifsc == '' ||
          bankName == '' ||
          city == '') {
        Fluttertoast.showToast(msg: 'Please fill all the fields..!!');
        return;
      } else if (sourceFile == null) {
        Fluttertoast.showToast(msg: 'Please select proper cancelled check photo image..!!');
        return;
      }
      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().multiPart(addVendorBankUrl, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'accountHolderName': payeeName,
        'accountNumber': accountNo,
        'ifscCode': ifsc,
        'bankName': bankName,
        'city': city,
        'cancelledCheckPhoto': sourceFile
      });

      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        print('>>$data');
        setState(() {
          _payeeNameController.text = "";
          _accController.text = "";
          _ifscController.text = "";
          _bankNameController.text = "";
          _cityController.text = "";
        });
        // _bankList=bankList['response'];
        // _upiList=upiList['response'];
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
          "Add New Bank Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: Container(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            Text(
              "Enter Bank Details to Receive Payouts",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 14,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10).copyWith(top: 15),
              child: Text(
                "Name of Payee",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
            ),
            AppEditTextField(
              controller: _payeeNameController,
              hintStyle: "Jon X",
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10).copyWith(top: 15),
              child: Text(
                "Account Number ",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
            ),
            AppEditTextField(
              controller: _accController,
              hintStyle: "543132163056",
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10).copyWith(top: 15),
              child: Text(
                "IFSC Code ",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
            ),
            AppEditTextField(
              controller: _ifscController,
              hintStyle: "MK54646SDD",
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10).copyWith(top: 15),
              child: Text(
                "Bank Name ",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
            ),
            AppEditTextField(
              controller: _bankNameController,
              hintStyle: "HDFC Bank",
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10).copyWith(top: 15),
              child: Text(
                "City ",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
            ),
            AppEditTextField(
              controller: _cityController,
              hintStyle: "Mumbai",
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10).copyWith(top: 15),
              child: Text(
                "Upload a cancelled Check ",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
            ),
            GestureDetector(
              onTap: _imagePicker,
              child: Container(
                width: 312,
                height: 101,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0xffe7e7e7),
                    width: 1,
                  ),
                  color: Color(0xfff6f6f6),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: sourceFile == null
                          ? Image.asset(
                              "assets/icon/setting_icon/document-upload.png",
                              width: 24,
                              height: 24,
                            )
                          : Image.file(
                              sourceFile!,
                              width: 80,
                              height: 80,
                            ),
                    ),
                    SizedBox(height: 12),
                    if (sourceFile == null)
                      Text(
                        "upload cancelled check here",
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 12,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: _addBank,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff523291),
                ),
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 15,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "SAVE & ADD",
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
          ],
        ),
      ),
    );
  }
}
