import 'package:flutter/material.dart';
import 'package:xyx_vendor/common/widget/app_scaffold.dart';
import 'package:xyx_vendor/screens/home/setting_screen/model/setting_menu.dart';
import 'package:xyx_vendor/screens/home/setting_screen/payout/payout_screen.dart';
import 'package:xyx_vendor/screens/home/setting_screen/print_setting/print_screen.dart';
import 'package:xyx_vendor/screens/home/setting_screen/store_details/store_change_url_screen.dart';
import 'package:xyx_vendor/screens/home/setting_screen/store_details/store_details_screen.dart';
import 'package:xyx_vendor/screens/home/setting_screen/store_details/store_location_screen.dart';
import 'package:xyx_vendor/screens/home/setting_screen/upload_document/upload_documnet.dart';
import 'package:xyx_vendor/screens/home/setting_screen/view_report_screen/view_reports_screen.dart';
import 'package:xyx_vendor/screens/home/store_screen/create_store_screen.dart';

import 'bank_upt_details/bank_upt_details.dart';
import 'close_store_screen/close_store_screen.dart';
import 'coupon_list_screen/coupon_list_screen.dart';
import 'delivery_distance_screen/delivery_distance_screen.dart';
import 'my_invoice/my_invoice_screen.dart';
import 'pre_order_setting/pre_order_screen.dart';
import 'qr_screen/qr_code_screen.dart';
import 'shipping_configuration_screen/shipping_configuration_screen.dart';
import 'shope_timing_screen/shope_timing_screen.dart';
import 'sponsored_screen/sponsored_screen.dart';
import 'store_details/store_image_screen.dart';
import 'tax_screen.dart';

class SettingsScreens extends StatefulWidget {
  const SettingsScreens({Key? key}) : super(key: key);

  @override
  _SettingsScreensState createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(
          "Manage Store",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: SizedBox.shrink(),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Container(
          alignment: Alignment.center,
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              for (var model in SettingModel.settingList)
                GestureDetector(
                  onTap: () {
                    onTap(model);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Color(0xffe7e7e7),
                        width: 1,
                      ),
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 3,
                          child: Image.asset(
                            model.icon,
                            width: 32,
                            height: 32,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            model.name,
                            textAlign: TextAlign.center,
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
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  void onTap(SettingModel model) {
    switch (model.flag) {
      case "store_details":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateStoreScreen(),
          ),
        );
        break;
      case "store_image":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoreImageScreen(),
          ),
        );
        break;

      case "store_location":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoreLocationScreen(),
          ),
        );
        break;

      case "store_change_url":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoreChangeUrlScreen(),
          ),
        );
        break;
      case "bank_details":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BankUPIDetailsScreen(),
          ),
        );
        break;
      case "pay_out_screen":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PayOutScreen(),
          ),
        );
        break;
      case "upload_document":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UploadDocumentScreen(),
          ),
        );
        break;
      case "view_repost":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewReportsScreen(),
          ),
        );
        break;
      case "close_store":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CloseStoreScreen(),
          ),
        );
        break;
      case "delivery_distance":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DeliveryDistanceScreen(),
          ),
        );
        break;
      case "sponsored_screen":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SponsoredScreen(),
          ),
        );
        break;
      case "qr_code":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QrCodeScreen(),
          ),
        );
        break;
      case "print_settings":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PrintSettingScreen(),
          ),
        );
        break;
      case "chat_with_admin":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SponsoredScreen(),
          ),
        );
        break;
      case "shop_timings":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShopTimingScreen(),
          ),
        );
        break;
      case "pre_order":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PreOrderSettingScreen(),
          ),
        );
        break;
      case "my_invoices":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyInvoiceScreen(),
          ),
        );
        break;
      case "shipping_configuration":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShippingConfigurationScreen(),
          ),
        );
        break;
      case "add_on_product":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SponsoredScreen(),
          ),
        );
        break;
      case "coupons":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CouponListScreen(),
          ),
        );
        break;
      case "taxes":
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaxScreen(),
          ),
        );
        break;

      default:
        break;
    }
  }
}
