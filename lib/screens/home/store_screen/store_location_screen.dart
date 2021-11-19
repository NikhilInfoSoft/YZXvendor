import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/common/widget/app_edit_text_widget.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:xyx_vendor/screens/home/home_screen/home_screen.dart';
import 'package:xyx_vendor/screens/home/store_screen/widget/store_progress_widget.dart';

class StoreLocationScreen extends StatelessWidget {
  final bool create;
  const StoreLocationScreen({Key? key, this.create = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _StoreLocationDesign(create: create);
  }
}

class _StoreLocationDesign extends StatefulWidget {
  final bool create;
  const _StoreLocationDesign({Key? key, this.create = false}) : super(key: key);

  @override
  _StoreLocationDesignState createState() => _StoreLocationDesignState();
}

class _StoreLocationDesignState extends State<_StoreLocationDesign> {
  bool isListingOnZyx = false;
  bool _progressVisible = false;
  TextEditingController _country = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _address = TextEditingController();
  double _latitude = 0;
  double _longitude = 0;

  _update() async {
    try {
      var country = _country.text;
      var city = _city.text;
      var address = _address.text;

      if (country == '' || city == '' || address == '') {
        Fluttertoast.showToast(msg: 'Please fill all the fields..!!');
        return;
      }

      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      Map data = await HttpController().post(saveStoreLocationUrl, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'storeCounty': country,
        'storeCity': city,
        'storeAddress': address,
        'storeLatitude': _latitude.toString(),
        'storeLongitude': _longitude.toString(),
      });
      setState(() {
        _progressVisible = false;
      });

      if (data.isNotEmpty) {
        if (widget.create) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false,
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      progress: _progressVisible,
      child: Container(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            StoreProgressWidget(
              index: 2,
            ),
            Text(
              "Location",
              style: TextStyle(
                color: Color(0xff111823),
                fontSize: 24,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Country",
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      AppEditTextField(
                        hintStyle: "India",
                        controller: _country,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "City",
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      AppEditTextField(
                        hintStyle: "Ahmedabad",
                        controller: _city,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Street",
              style: TextStyle(
                color: Color(0xff666666),
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            AppEditTextField(
              hintStyle: "",
              controller: _address,
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                "assets/icon/mapimage.png",
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                Text(
                  "Listing on Zyx App",
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
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffe5e5e5),
                    ),
                    child: Center(
                      child: Text(
                        "BACK",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff523291),
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: _update,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xff523291),
                      ),
                      padding: const EdgeInsets.only(
                          top: 16, bottom: 15, left: 20, right: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "NEXT",
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
          ],
        ),
      ),
    );
  }
}
