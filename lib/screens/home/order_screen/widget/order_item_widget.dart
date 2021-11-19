import 'package:flutter/material.dart';
import 'package:xyx_vendor/screens/home/order_screen/order_details/order_details_screen.dart';

enum OrderStatus {
  Pending,
  Accepted,
  Shipped,
  Delivered,
}

class OrderItemWidget extends StatelessWidget {
  final OrderStatus orderStatus;

  const OrderItemWidget({Key? key, this.orderStatus = OrderStatus.Pending})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderDetailsScreen(
              orderStatus:orderStatus
          )),
        );
      },
      child: Container(
        height: 90,
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Color(0xffe7e7e7),
            width: 1,
          ),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color(0xffe7e7e7),
                  width: 1,
                ),
              ),
              child: FlutterLogo(size: 70),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "#254682",
                    style: TextStyle(
                      color: Color(0xff929292),
                      fontSize: 12,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Jacob Jones",
                    style: TextStyle(
                      color: Color(0xff252733),
                      fontSize: 16,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "14 Aug 2021",
                    style: TextStyle(
                      color: Color(0xff252733),
                      fontSize: 12,
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (orderStatus == OrderStatus.Pending) pendingStatus(),
                if (orderStatus == OrderStatus.Accepted) acceptedStatus(),
                if (orderStatus == OrderStatus.Delivered) deliveredStatus(),
                if (orderStatus == OrderStatus.Shipped) shippedStatus(),
                // if (orderStatus == OrderStatus.Pending) _pendingStatus(),
                // if (orderStatus == OrderStatus.Pending) _pendingStatus(),
                Spacer(),
                Text(
                  "\$1800",
                  style: TextStyle(
                    color: Color(0xff523291),
                    fontSize: 16,
                    fontFamily: "Mulish",
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }


}
Widget pendingStatus() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Color(0xffff9900).withOpacity(0.2),
    ),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    alignment: Alignment.center,
    child: Text(
      "Pending",
      style: TextStyle(
        color: Color(0xffff9900),
        fontSize: 12,
        fontFamily: "Mulish",
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

Widget acceptedStatus() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Color(0xff00992a).withOpacity(0.2),
    ),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    alignment: Alignment.center,
    child: Text(
      "Pending",
      style: TextStyle(
        color: Color(0xff00992a),
        fontSize: 12,
        fontFamily: "Mulish",
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

Widget shippedStatus() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Color(0xff00a3ff).withOpacity(0.2),
    ),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    alignment: Alignment.center,
    child: Text(
      "Pending",
      style: TextStyle(
        color: Color(0xff00a3ff),
        fontSize: 12,
        fontFamily: "Mulish",
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

Widget deliveredStatus() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Color(0xff666666).withOpacity(0.2),
    ),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    alignment: Alignment.center,
    child: Text(
      "Pending",
      style: TextStyle(
        color: Color(0xff666666),
        fontSize: 12,
        fontFamily: "Mulish",
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}