import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/common/widget/menu_icon.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';

class TaxScreen extends StatefulWidget {
  const TaxScreen({Key? key}) : super(key: key);

  @override
  _TaxScreenState createState() => _TaxScreenState();
}

class _TaxScreenState extends State<TaxScreen> {
  bool _progressVisible = false;
  List _taxList = [];
  TextEditingController _name = TextEditingController();
  TextEditingController _tax = TextEditingController();

  _create() async {
    try {
      var name = _name.text;
      var tax = _tax.text;

      if (name == '' || tax == '') {
        Fluttertoast.showToast(msg: 'Please fill all the fields..!!');
        return;
      }

      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      print(user);

      Map data = await HttpController().post(addTaxUrl, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'taxName': name,
        'taxPercentage': tax,
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        _name.text = '';
        _tax.text = '';
        _data();
      }
    } catch (e) {
      print(e);
    }
  }

  _data() async {
    try {
      _taxList.clear();
      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      print(user);
      Map data = await HttpController().get(taxListUrl, body: {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        _taxList = data['response'];
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
          "Taxes List & Add Tax",
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
              child: Text(
                "ADD NEW TAX",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xff523291),
                  fontSize: 14,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView(
              shrinkWrap: true,
              children: List.generate(_taxList.length, (index) {
                return _taxTile(
                  _taxList[index]['taxId'].toString(),
                  _taxList[index]['taxName'].toString(),
                  _taxList[index]['taxPercentage'].toString(),
                );
              }),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                "Tax Name",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
            ),
            AppEditTextField(
              hintStyle: "Enter here ",
              controller: _name,
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                "Tax Percentage",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
            ),
            AppEditTextField(
              hintStyle: "Enter here ",
              controller: _tax,
              keyboard: TextInputType.number,
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: _create,
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff523291),
                ),
                alignment: Alignment.center,
                child: Text(
                  "SAVE & ADD",
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

  Widget _taxTile(String id, String name, String tax) {
    return Container(
      height: 67,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xffe7e7e7),
          width: 1,
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Color(0xff252733),
                  fontSize: 14,
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                tax,
                style: TextStyle(
                  color: Color(0xff523291),
                  fontSize: 14,
                  fontFamily: "Mulish",
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          Positioned(
            right: 0,
            top: 10,
            child: ThreeDotWidget(),
          ),
        ],
      ),
    );
  }
}
