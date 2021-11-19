import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xyx_vendor/Localizations/localization.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_droupdown_widget.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';

class StoreDetailsScreen extends StatefulWidget {
  const StoreDetailsScreen({Key? key}) : super(key: key);

  @override
  _StoreDetailsScreenState createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  bool isListingOnZyx = false;
   TextEditingController _storeNameController = TextEditingController();
  TextEditingController _gstNoController = TextEditingController();
  String _currency="";

  
bool _progressVisible= false;
 _updateStoreDetail() async {

    try {
       var storeName = _storeNameController.text;
       var gstNo = _gstNoController.text;
       if (storeName == '' ||
          gstNo == '' ) {
        Fluttertoast.showToast(msg: 'Please fill all the fields..!!');
        return;
      } 
     

      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().post(updateStoreDetailsUrl,{
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
'storeName':_storeNameController,
'gstNumber':_gstNoController,
'currency':_currency,

      });
      
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        // print('>>data');
        setState(() {
          _storeNameController.text="";
          _gstNoController.text="";
          _currency="";
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
          "Store Details",
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
              SizedBox(
                height: 10,
              ),
              Text(
                "store name",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              AppEditTextField(
                controller:_storeNameController,
                hintStyle: "Newland",
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "GST Number",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              AppEditTextField(
                controller: _gstNoController,
                hintStyle: "22xxxxxxxxxxxz5",
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    AppLocalizations.instance.text("listingOnZyxApp"),
                    // "Listing on Zyx App",
                    style: TextStyle(
                      color: Color(0xff111823),
                      fontSize: 12,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Switch(
                    value: isListingOnZyx,
                    activeColor: AppColors.primary,
                    onChanged: (value) {
                      setState(() {
                        isListingOnZyx = !isListingOnZyx;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Choose Default Currency",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              AppDropDownWidget(

                changeChosen: (s){
                  setState(() {
                    _currency=s;
                  });
                },
                hint: '',
                list: ["₹", "\$"],
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: _updateStoreDetail,
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
