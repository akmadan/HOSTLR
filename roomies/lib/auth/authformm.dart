import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:roomies/ui/logo.dart';
import 'package:roomies/ui/text.dart';
import 'package:roomies/widgets/locationcaution.dart';


class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  var isLoginpage = false;
  var email = '';
  var first = '';
  var last = '';
  var password = '';
  var phone;
  String dropdownValue = 'Pimpri';

  void trysubmit() {
    Fluttertoast.showToast(msg: 'This may take a while');
    final isValid = _formkey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formkey.currentState.save();
      _submitAuthForm(first, last, phone, email, password, isLoginpage);
      print(_formkey.currentState);
    }
  }

//-----------------------------------------------------------------------
// Firebase Authentication

  final _auth = FirebaseAuth.instance;
  void _submitAuthForm(String first, String last, String phone, String email,
      String password, bool isLoginPage) async {
    AuthResult authresult;
    try {
      if (isLoginPage) {
        authresult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authresult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String uid = authresult.user.uid;
        await Firestore.instance
            .collection('userlocations')
            .document(uid)
            .setData({'location': dropdownValue.toLowerCase()});
        
        await Firestore.instance
            .collection('users')
            .document(dropdownValue.toLowerCase())
            .collection('data')
            .document(uid)
            .setData({
          'uid': uid,
          'name': first + ' ' + last,
          'phone': phone,
          'email': email,
          'password': password,
          'location': dropdownValue.toLowerCase()
        });
        
      }
    } on PlatformException catch (err) {
      var message = 'An error occured';
      if (err.message != null) {
        message = err.message;
      }
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ));
    } catch (err) {
      print(err);
    }
  }

  //--------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h,
      width: w,
      child: ListView(
        children: [
          Logo(),
          loginText(),
          Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  if (!isLoginpage)
                    Row(
                      //-----------------NAME-----------------------

                      children: [
                        Expanded(
                          child: TextFormField(
                            key: ValueKey('first'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'First Name should not be empty';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(8.0),
                                    borderSide: new BorderSide()),
                                labelText: "First Name",
                                labelStyle: TextStyle(fontFamily: 'SFPro')),
                            onSaved: (value) {
                              first = value;
                            },
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Expanded(
                          child: TextFormField(
                            key: ValueKey('last'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Last Name should not be empty';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(8.0),
                                    borderSide: new BorderSide()),
                                labelText: "Last Name",
                                labelStyle: TextStyle(fontFamily: 'SFPro')),
                            onSaved: (value) {
                              last = value;
                            },
                          ),
                        ),

                        //-----------------NAME-----------------------
                      ],
                    ),
                  //-----------------PHONE-----------------------
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  if (!isLoginpage)
                    TextFormField(
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      key: ValueKey('phone'),
                      validator: (value) {
                        if (value.length < 10) {
                          return 'Incorrect Phone';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(8.0),
                              borderSide: new BorderSide()),
                          labelText: "Enter Phone no.",
                          labelStyle: TextStyle(fontFamily: 'SFPro')),
                      onSaved: (value) {
                        phone = value;
                      },
                    ),
                  //-----------------List of Locations----------------
                  if (!isLoginpage)
                    Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey[700]),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 60.0,
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: dropdownValue,
                                  style: TextStyle(fontFamily: 'SFPro'),
                                  underline: Container(
                                    height: 2,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                    });
                                  },
                                  items: <String>[
                                    'Pimpri',
                                    'Dhankawadi',
                                    'Chinchwad',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        )),
                  if (!isLoginpage) LocationCaution(),

                  //---------------List of Locations----------------

                  //-----------------PHONE-----------------------
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    key: ValueKey('email'),
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Incorrect Email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                            borderSide: new BorderSide()),
                        labelText: "Enter Email",
                        labelStyle: TextStyle(fontFamily: 'SFPro')),
                    onSaved: (value) {
                      email = value;
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  TextFormField(
                    obscureText: true,
                    key: ValueKey('password'),
                    onSaved: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return 'Password length should be more than 5';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                            borderSide: new BorderSide()),
                        labelText: "Enter Password",
                        labelStyle: TextStyle(fontFamily: 'SFPro')),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 70,
            padding: EdgeInsets.all(10),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  trysubmit();
                },
                child: isLoginpage
                    ? bold_text(
                        text: "Login",
                        size: 18,
                      )
                    : bold_text(
                        text: 'Sign Up',
                        size: 18,
                      )),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                isLoginpage = !isLoginpage;
              });
            },
            child: Text(
              isLoginpage
                  ? 'New to Hostlr ? Create account'
                  : 'Already have an account ? Login',
              style: TextStyle(fontFamily: 'SFPro', color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  //----------------------------------------------------

  Widget loginText() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoginpage
              ? Expanded(
                  child:
                      Center(child: bold_text(text: 'Welcome back', size: 25)))
              : Expanded(
                  child: Center(
                      child: bold_text(text: 'Register yourself', size: 25)),
                ),
        ],
      ),
    );
  }
}
