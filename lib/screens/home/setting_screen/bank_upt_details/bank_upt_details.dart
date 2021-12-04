import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:xyx_vendor/screens/home/setting_screen/bank_upt_details/add_new_bank_screen.dart';

import 'add_new_upi_screen.dart';

class BankUPIDetailsScreen extends StatefulWidget {
  const BankUPIDetailsScreen({Key? key}) : super(key: key);

  @override
  _BankUPIDetailsScreenState createState() => _BankUPIDetailsScreenState();
}

class _BankUPIDetailsScreenState extends State<BankUPIDetailsScreen> {
  bool _progressVisible = false;
  String selectedRadio = "";
  String selectedAddress = "";
  List _bankList = [];
  List _upiList = [];

  _data() async {
    try {
      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map bankList = await HttpController().get(getBankListUrl, body: {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
      });
      Map upiList = await HttpController().get(getUpiListUrl, body: {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
      });
      setState(() {
        _progressVisible = false;
      });

      if (bankList.isNotEmpty && upiList.isNotEmpty) {
        _bankList=bankList['response'];
        _upiList=upiList['response'];
        print(_upiList);
        print(_bankList);
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
          "Bank/UPI Details",
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
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Banks Details",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 14,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            
           
           ...List<Widget>.generate(_bankList.length,(i){
return Row(
              children: [
                Radio(
                  value: selectedRadio,
                  groupValue: "test",
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = "test";
                    });
                  },
                ),
                Text(
                  _bankList[i]['bankName'],
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 16,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            );
           }),
           
            // Row(
            //   children: [
            //     Radio(
            //       value: selectedRadio,
            //       groupValue: "State Bank of India",
            //       activeColor: AppColors.primary,
            //       onChanged: (value) {
            //         setState(() {
            //           selectedRadio = "State Bank of India";
            //         });
            //       },
            //     ),
            //     Text(
            //       " State Bank of India",
            //       style: TextStyle(
            //         color: Color(0xff666666),
            //         fontSize: 16,
            //         fontFamily: "Inter",
            //         fontWeight: FontWeight.w500,
            //       ),
            //     )
            //   ],
            // ),
            // Row(
            //   children: [
            //     Radio(
            //       value: selectedRadio,
            //       groupValue: "Hdfc Bank",
            //       activeColor: AppColors.primary,
            //       onChanged: (value) {
            //         setState(() {
            //           selectedRadio = "Hdfc Bank";
            //         });
            //       },
            //     ),
            //     Text(
            //       " Hdfc Bank",
            //       style: TextStyle(
            //         color: Color(0xff666666),
            //         fontSize: 16,
            //         fontFamily: "Inter",
            //         fontWeight: FontWeight.w500,
            //       ),
            //     )
            //   ],
            // ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "UPI Address",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 14,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
           
           
             ...List<Widget>.generate(_upiList.length,(i){
      return  Row(
              children: [
                Radio(
                  value: selectedAddress,
                  groupValue: "Jonxyz@hdfc.com",
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      selectedAddress = "Jonxyz@hdfc.com";
                    });
                  },
                ),
                Text(
                  _upiList[i]['upi'],
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 16,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            );
           }),
           
           
            
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewBankScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xff523291),
                ),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                alignment: Alignment.center,
                child: Text(
                  "ADD NEW BANK DETAILS",
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewUPIScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                alignment: Alignment.center,
                child: Text(
                  "Add New UPI ID",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff523291),
                    fontSize: 16,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
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
