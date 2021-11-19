import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _progressVisible = false;
  bool _whatsappNotification = false;
  TextEditingController _name = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _whatsapp = TextEditingController();

  _update() async {
    try {
      var name = _name.text;
      var number = _number.text;
      var email = _email.text;
      var whatsapp = _whatsapp.text;

      if (name == '' || number == '' || email == '' || whatsapp == '') {
        Fluttertoast.showToast(msg: 'Please fill all the fields..!!');
        return;
      }

      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().get(editProfileUrl, body: {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'vendorName': name,
        'vendorCountryCode': '+91',
        'vendorContactNumber': number,
        'vendorEmail': email,
        'vendorWhatsappNumber': whatsapp,
        'enableWhatsappNotification': _whatsappNotification.toString(),
      });
      setState(() {
        _progressVisible = false;
      });
    } catch (e) {
      print(e);
    }
  }

  _data() async {
    try {
      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().get(getProfileUrl, body: {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        setState(() {
          _name.text = data['response']['vendorName'];
          _number.text = data['response']['vendorContactNumber'];
          _email.text = data['response']['vendorEmail'];
          _whatsapp.text = data['response']['vendorWhatsappNumber'];
          print(data['response']['enableWhatsappNotification']);
          // _whatsappNotification = data['response']['enabledWhatsappNotification'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _data();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      progress: _progressVisible,
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
            AppEditTextField(
              hintStyle: "John",
              controller: _name,
            ),
            SizedBox(height: 15),
            Text(
              "Phone number",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 49,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff523291),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "+91",
                    style: TextStyle(
                      color: Color(0xffe5e5e5),
                      fontSize: 16,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: AppEditTextField(
                    hintStyle: "xxx-xxx-xxxx",
                    controller: _number,
                    keyboard: TextInputType.number,
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            Text(
              "Email Id",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
            AppEditTextField(
              hintStyle: "john21@gmail.com",
              controller: _email,
              keyboard: TextInputType.emailAddress,
            ),
            SizedBox(height: 15),
            Text(
              "Whatsapp Number",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 49,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0xff523291),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "+91",
                    style: TextStyle(
                      color: Color(0xffe5e5e5),
                      fontSize: 16,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: AppEditTextField(
                    hintStyle: "xxx-xxx-xxxx",
                    controller: _whatsapp,
                    keyboard: TextInputType.number,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Checkbox(
                  value: _whatsappNotification,
                  onChanged: (value) {
                    setState(() {
                      _whatsappNotification = value ?? false;
                    });
                  },
                  activeColor: AppColors.primary,
                ),
                Text(
                  "Enable whatsapp notification",
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: _update,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff523291),
                ),
                alignment: Alignment.center,
                child: Text(
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
