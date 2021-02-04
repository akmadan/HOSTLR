import 'package:flutter/material.dart';
import 'package:roomies/ui/text.dart';

class OtherInfo extends StatefulWidget {
  static String dropdownValue = 'Pimpri';
  static TextEditingController addresscontroller = TextEditingController();
  static TextEditingController rentcontroller = TextEditingController();
  static TextEditingController timecontroller = TextEditingController();
  static TextEditingController descriptioncontroller = TextEditingController();

  @override
  _OtherInfoState createState() => _OtherInfoState();
}

class _OtherInfoState extends State<OtherInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: OtherInfo.addresscontroller,
            decoration: InputDecoration(
                hintText: 'Address', border: OutlineInputBorder()),
          ),
        ),

        //-----------------------------------------

        Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[700]),
            borderRadius: BorderRadius.circular(5.0),
          ),
          width: MediaQuery.of(context).size.width,
          height: 60.0,
          child: DropdownButton<String>(
            isExpanded: true,
            value: OtherInfo.dropdownValue,
            style: TextStyle(fontFamily: 'SFPro'),
            underline: Container(
              height: 2,
            ),
            onChanged: (String newValue) {
              setState(() {
                OtherInfo.dropdownValue = newValue;
              });
            },
            items: <String>[
              'Pimpri',
              'Dhankawadi',
              'Chinchwad',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),

        //-----------------------------------------

        Row(children: [
          Expanded(
            child: Container(
              // color: Colors.red,
              padding: EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 6,
                controller: OtherInfo.rentcontroller,
                decoration: InputDecoration(
                    hintText: 'Rent in Rupees', border: OutlineInputBorder()),
              ),
            ),
          ),
          Container(padding: EdgeInsets.all(5), child: bold_text(text: 'for')),
          Expanded(
            child: Container(
              // color: Colors.blue,
              padding: EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 2,
                controller: OtherInfo.timecontroller,
                decoration: InputDecoration(
                    hintText: 'no. of months', border: OutlineInputBorder()),
              ),
            ),
          ),
        ]),
        Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            controller: OtherInfo.descriptioncontroller,
            decoration: InputDecoration(
                hintText: 'Description (optional)',
                border: OutlineInputBorder()),
          ),
        ),
      ],
    ));
  }
}
