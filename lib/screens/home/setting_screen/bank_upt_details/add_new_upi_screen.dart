import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';

class AddNewUPIScreen extends StatefulWidget {
  const AddNewUPIScreen({Key? key}) : super(key: key);

  @override
  _AddNewUPIScreenState createState() => _AddNewUPIScreenState();
}

class _AddNewUPIScreenState extends State<AddNewUPIScreen> {
  TextEditingController _upi = TextEditingController();


bool _progressVisible= false;
 _addUpi() async {
    try {
      var name = _upi.text;
      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().post(addVendorUpiUrl,{
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'upiId':name,

      });
      
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        // print('>>data');
        setState(() {
          _upi.text="";
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
          "Add new UPI ID",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        )
      ),
      child: Container(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [

            Container(
              padding: EdgeInsets.symmetric(vertical: 10).copyWith(top: 15),
              child: Text(
                "Enter UPI ID/ VPA",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
            ),
            AppEditTextField(
              controller: _upi,
              hintStyle: "jonxyz@hdfc.com",
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: _addUpi,
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
