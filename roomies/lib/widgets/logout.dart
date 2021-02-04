import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:roomies/ui/text.dart';

class LogoutWidget extends StatefulWidget {
  @override
  _LogoutWidgetState createState() => _LogoutWidgetState();
}

class _LogoutWidgetState extends State<LogoutWidget> {
  bool logoutdown = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bold_text(
                    text: 'Logout',
                    size: 24,
                  ),
                  modified_text(
                    text: 'Do you wish to Logout ?',
                    color: Colors.grey[400],
                  )
                ],
              ),
              IconButton(
                  icon: Icon(logoutdown
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down),
                  onPressed: () {
                    setState(() {
                      logoutdown = !logoutdown;
                    });
                  })
            ],
          ),
          SizedBox(height: 15),
          logoutdown
              ? Container(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            height: 50,
                            child: RaisedButton(
                              child: modified_text(
                                  text: 'Cancel',
                                  color: Colors.grey[900],
                                  size: 18),
                              color: Colors.grey[100],
                              onPressed: () {
                                setState(() {
                                  logoutdown = !logoutdown;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            )),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                            height: 50,
                            child: RaisedButton(
                              child: modified_text(
                                  text: 'Confirm',
                                  color: Colors.white,
                                  size: 18),
                              color: Theme.of(context).primaryColor,
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            )),
                      ),
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
