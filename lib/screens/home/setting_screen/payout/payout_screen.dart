import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/controller/httpController.dart';
import 'package:xyx_vendor/controller/shared_data.dart';
import 'package:xyx_vendor/controller/url.dart';
import 'package:xyx_vendor/screens/home/setting_screen/payout/request_payout_screen.dart';

import 'widget/payout_item_widget.dart';

class PayOutScreen extends StatefulWidget {
  const PayOutScreen({Key? key}) : super(key: key);

  @override
  _PayOutScreenState createState() => _PayOutScreenState();
}

class Constants {
  static const String Pending = 'Pending';
  static const String Accepted = 'Accepted';
  static const String Rejected = 'Rejected';

  static const List<String> choices = <String>[Pending, Accepted, Rejected];
}

class _PayOutScreenState extends State<PayOutScreen> {
  bool _progressVisible = false;
  List payoutDetail = [];

  getPayout() async {
    try {
      setState(() {
        _progressVisible = true;
      });
      Map user = await SharedData().getUser();
      print({
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'requestStatus': _selectedChoice == Constants.Pending
            ? '0'
            : _selectedChoice == Constants.Accepted
                ? '1'
                : '2',
      });
      Map data = await HttpController().post(getVendorPayoutList, {
        'vendorId': user['id'].toString(),
        'vendorToken': user['token'].toString(),
        'requestStatus': _selectedChoice == Constants.Pending
            ? '0'
            : _selectedChoice == Constants.Accepted
                ? '1'
                : '2',
      });
      // http.Response res =
      //     await http.post(Uri.parse(getVendorInvoiceDetail), body: {
      //   "vendorId": "1",
      //   "vendorToken": "ee8e3ae8f721545caaac83dd77cafd4a",
      //   "invoiceNumber": "1"
      // }
      //         //  {
      //   'vendorId': user['id'].toString(),
      //   'vendorToken': user['token'].toString(),
      //   'invoiceNumber': invoiceNumber,
      // }
      // );
      // Map data = json.decode(res.body);

      if (data.isNotEmpty) {
        // print(data);
        if (data['response'] != null) {
          payoutDetail = data['response'];
          print(payoutDetail[0]);
        } else {
          payoutDetail = [];
        }
      }
      setState(() {
        _progressVisible = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getPayout();

    super.initState();
  }

  String _selectedChoice = Constants.Pending; // The app's "state".

  void choiceAction(String choice) {
    if (choice == Constants.Pending) {
      _selectedChoice = Constants.Pending;
      getPayout();
      print('Settings');
    } else if (choice == Constants.Accepted) {
      _selectedChoice = Constants.Accepted;
      getPayout();

      print('Subscribe');
    } else if (choice == Constants.Rejected) {
      _selectedChoice = Constants.Rejected;
      getPayout();

      print('SignOut');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      progress: _progressVisible,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Payout",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.filter_alt),
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  margin: EdgeInsets.only(bottom: 40),
                  decoration: BoxDecoration(
                    color: Color(0xff523291),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 105,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xfff8f5ff),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icon/empty-wallet.png",
                          height: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "My Balance",
                              style: TextStyle(
                                color: Color(0xff252733),
                                fontSize: 14,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "497.05",
                              style: TextStyle(
                                color: Color(0xff252733),
                                fontSize: 20,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 35,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RequestPayOutScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xff523291),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      child: Text(
                        "REQUEST PAYOUT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "All Payout Transactions",
                    style: TextStyle(
                      color: Color(0xff666666),
                      fontSize: 14,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  if (payoutDetail.isNotEmpty)
                    ...List<Widget>.generate(payoutDetail.length, (index) {
                      return PayoutItemWidget(
                        requestAmount: payoutDetail[index]['requestAmount'].toString(),
                        requestDate: payoutDetail[index]['requestDate'],
                        requestStatus: payoutDetail[index]['requestStatus'].toString(),
                      );
                    })
                  // PayoutItemWidget(),
                  // PayoutItemWidget(),
                  // PayoutItemWidget(),
                  // PayoutItemWidget(),
                  // PayoutItemWidget(),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     border: Border.all(
                  //       color: Color(0xffe7e7e7),
                  //       width: 1,
                  //     ),
                  //     color: Colors.white,
                  //   ),
                  //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Text(
                  //             "01-Aug-2021, 11.25 AM",
                  //             style: TextStyle(
                  //               color: Color(0xff929292),
                  //               fontSize: 12,
                  //               fontFamily: "Mulish",
                  //               fontWeight: FontWeight.w600,
                  //             ),
                  //           ),
                  //           Spacer(),
                  //           Container(
                  //             decoration: BoxDecoration(
                  //               borderRadius: BorderRadius.circular(4),
                  //               color: Color(0xffde0000).withOpacity(0.2),
                  //             ),
                  //             padding: EdgeInsets.symmetric(
                  //                 horizontal: 10, vertical: 5),
                  //             child: Text(
                  //               "Reject",
                  //               style: TextStyle(
                  //                 color: Color(0xffde0000),
                  //                 fontSize: 12,
                  //                 fontFamily: "Mulish",
                  //                 fontWeight: FontWeight.w700,
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       SizedBox(
                  //         height: 10,
                  //       ),
                  //       Text(
                  //         "150.00",
                  //         style: TextStyle(
                  //           color: Color(0xffde0000),
                  //           fontSize: 16,
                  //           fontFamily: "Mulish",
                  //           fontWeight: FontWeight.w700,
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         height: 10,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
