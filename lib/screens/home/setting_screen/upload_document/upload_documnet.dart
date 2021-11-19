import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:xyx_vendor/screens/home/category/widget/menu_widget.dart';

import 'widget/doc_upload_widget.dart';

class UploadDocumentScreen extends StatefulWidget {
  const UploadDocumentScreen({Key? key}) : super(key: key);

  @override
  _UploadDocumentScreenState createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {

  bool _progressVisible = false;
  ImagePicker _picker = ImagePicker();
  

File? shopFront;
File? shopBack;
File? incorporationFront;
File? incorporationBack;
File? companyPanFront;
File? companyPanBack;
File? ownerPanFront;
File? ownerPanBack;
File? ownerAadharFront;
File? ownerAadharBack;
File? otherFront;
File? otherBack;

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



        switch (i) {
          case 0:
            shopFront=File(file.path);
            break;
             case 1:
            shopBack=File(file.path);
            break;
              case 2:
            incorporationFront=File(file.path);
            break;
             case 3:
            incorporationBack=File(file.path);
            break;
            case 4:
            companyPanFront=File(file.path);
            break;
            case 5:
            companyPanBack=File(file.path);
            break;
            case 6:
            ownerPanFront=File(file.path);
            break;
             case 7:
            ownerPanBack=File(file.path);
            break;
            case 8:
            ownerAadharFront=File(file.path);
            break;
             case 9:
            ownerAadharBack=File(file.path);
            break;
            case 10:
            otherFront=File(file.path);
            break;
            case 11:
            otherBack=File(file.path);
            break;
          default:
        }
       setState(() {
         print(shopFront!.path);
       });
      }
    } catch (e) {
      print(e);
    }
  }

Widget renderImage(File image){
  return Container(
                       width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Color(0xffe7e7e7),
          width: 1,
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
                      child: Column(
                        children: [
                          Image.file(image,width: 150,height: 150,),
                        ],
                      ),
                    );
}


_uploadDocument() async {
    try {
     
       if (shopFront == null|| shopBack ==null|| 
       incorporationFront == null|| incorporationBack ==null
       ||companyPanFront == null|| companyPanBack ==null
        ||ownerPanFront == null|| ownerPanBack ==null
        ||ownerAadharFront == null|| ownerAadharBack ==null
        ||otherFront == null|| otherBack ==null
       
       ) {
        Fluttertoast.showToast(msg: 'Please select all images..!!');
        return;
      }

      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().multiPart(vendorUploadDocument, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'shopFront':shopFront,
        'shopBack':shopBack,
        'incorporationFront':incorporationFront,
        'incorporationBack':incorporationBack,
        'companyPanFront':companyPanFront,
        'companyPanBack':companyPanBack,
        'ownerPanFront':ownerPanFront,
        'ownerPanBack':ownerPanBack,
        'ownerAadharFront':ownerAadharFront,
        'ownerAadharBack':ownerAadharBack,
        'otherFront':otherFront,
        'otherBack':otherBack,
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        
        setState(() {
         
          
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
          "Upload Document",
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
          padding: EdgeInsets.all(20),
          children: [
            Container(
              padding: EdgeInsets.only(top: 20,bottom: 10),
              child: Text(
                "Shop Document",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 14,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: ()=>_imagePicker(0),
                    child: shopFront!=null?renderImage(shopFront!):  DocUploadWidget(title: "Upload Front"))
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: GestureDetector(
                    onTap: ()=>_imagePicker(1),
                    child: shopBack!=null?renderImage(shopBack!):  DocUploadWidget(title: "Upload Back"))
                ),
                
              ],
            ),Container(
              padding: EdgeInsets.only(top: 20,bottom: 10),
              child: Text(
                "Incorporation Certificate",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 14,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: ()=>_imagePicker(2),
                    child: incorporationFront!=null?renderImage(incorporationFront!):  DocUploadWidget(title: "Upload Front"))
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: GestureDetector(
                    onTap: ()=>_imagePicker(3),
                    child: incorporationBack!=null?renderImage(incorporationBack!):  DocUploadWidget(title: "Upload Back"))
                ),
              ],
            ),Container(
              padding: EdgeInsets.only(top: 20,bottom: 10),
              child: Text(
                "PAN Card of Company",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 14,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: ()=>_imagePicker(4),
                    child: companyPanFront!=null?renderImage(companyPanFront!):  DocUploadWidget(title: "Upload Front"))
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: GestureDetector(
                    onTap: ()=>_imagePicker(5),
                    child: companyPanBack!=null?renderImage(companyPanBack!):  DocUploadWidget(title: "Upload Back"))
                ),
              ],
            ),Container(
              padding: EdgeInsets.only(top: 20,bottom: 10),
              child: Text(
                "PAN Card of Director/Owner",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 14,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              children: [
                 Expanded(
                  child: GestureDetector(
                    onTap: ()=>_imagePicker(6),
                    child: ownerPanFront!=null?renderImage(ownerPanFront!):  DocUploadWidget(title: "Upload Front"))
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: GestureDetector(
                    onTap: ()=>_imagePicker(7),
                    child: ownerPanBack!=null?renderImage(ownerPanBack!):  DocUploadWidget(title: "Upload Back"))
                ),
              ],
            ),Container(
              padding: EdgeInsets.only(top: 20,bottom: 10),
              child: Text(
                "Aadhar Card or Owner",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 14,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              children: [
                 Expanded(
                  child: GestureDetector(
                    onTap: ()=>_imagePicker(8),
                    child: ownerAadharFront!=null?renderImage(ownerAadharFront!):  DocUploadWidget(title: "Upload Front"))
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: GestureDetector(
                    onTap: ()=>_imagePicker(9),
                    child: ownerAadharBack!=null?renderImage(ownerAadharBack!):  DocUploadWidget(title: "Upload Back"))
                ),
              ],
            ),Container(
              padding: EdgeInsets.only(top: 20,bottom: 10),
              child: Text(
                "Others",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 14,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              children: [
                 Expanded(
                  child: GestureDetector(
                    onTap: ()=>_imagePicker(10),
                    child: otherFront!=null?renderImage(otherFront!):  DocUploadWidget(title: "Upload Front"))
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: GestureDetector(
                    onTap: ()=>_imagePicker(11),
                    child: otherBack!=null?renderImage(otherBack!):  DocUploadWidget(title: "Upload Back"))
                ),
              ],
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: _uploadDocument,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff523291),
                ),
                alignment: Alignment.center,
                child:  Text(
                  "SAVE",
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
    );
  }
}
