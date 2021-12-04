import 'package:flutter/material.dart';

class AppDropDownWidget extends StatefulWidget {
  final String hint;
  final List<String> list;
  final Function? changeChosen;
  final String? chosen;
  const AppDropDownWidget({
    Key? key,
    required this.hint,
    required this.list,
    this.changeChosen,
    this.chosen,
  }) : super(key: key);

  @override
  _AppDropDownWidgetState createState() => _AppDropDownWidgetState();
}

class _AppDropDownWidgetState extends State<AppDropDownWidget> {
  String? _chosenValue;
  List<DropdownMenuItem<String>> dropDownList = [];
  // @override
  // void initState() {
  //   super.initState();
  //   print('editng');
  //   if (widget.list.isNotEmpty) {
  //     _chosenValue = widget.list.last;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    _chosenValue = widget.chosen != null ? widget.chosen! : widget.list.first;

    dropDownList = widget.list.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
          style: TextStyle(color: Colors.black),
        ),
      );
    }).toList();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xffe7e7e7),
          width: 1,
        ),
        color: Color(0xfff6f6f6),
      ),
      padding: EdgeInsets.only(left: 10),
      child: DropdownButton<String>(
        focusColor: Colors.white,
        value: _chosenValue,
        //elevation: 5,
        icon:
            Icon(Icons.keyboard_arrow_down_outlined, color: Color(0xff666666)),
        style: TextStyle(color: Colors.white),
        iconEnabledColor: Colors.black,
        isExpanded: true,
        underline: Container(),
        items: dropDownList,
        hint: Text(
          widget.hint,
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        onChanged: (String? value) {
          setState(() {
            _chosenValue = value!;
            widget.changeChosen!(_chosenValue);
          });
        },
      ),
    );
  }
}
