import 'package:flutter/material.dart';
//import 'package:cool_alert/cool_alert.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
//import '../Screens/inputscreen.dart';
import '../database/xcelapi.dart';
import '../database/xcelmodels.dart';
//import './homescreen.dart';
import '../database/provider.dart';
import '../User_interface/Home.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.type}) : super(key: key);

  final String title;
  final String type;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextField Controllers
  TextEditingController nameController = TextEditingController();
  //TextEditingController emailController = TextEditingController();
  TextEditingController regnoController = TextEditingController();
  TextEditingController secController = TextEditingController();
  TextEditingController issController = TextEditingController();
  //FocusNode fc = FocusNode();

  // Method to Submit Feedback and save it in Google Sheets
  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.
    if (_formKey.currentState.validate()) {
      // If the form is valid, proceed.
      // CoolAlert.show(
      //   context: context,
      //   type: CoolAlertType.loading,
      //   text: "Loading......",
      // );
      FeedbackForm feedbackForm = FeedbackForm(
          nameController.text,
          regnoController.text,
          secController.text,
          issController.text,
          widget.type);
      // print(" type is printing ${widget.type}");

      FormController formController = FormController();

      //  _showSnackbar(
      //     "If Booking Status is success \n You will be Automatically Redirect to home");

      // Submit 'feedbackForm' and save it in Google Sheets.
      //print("$feedbackForm");
      formController.submitForm(feedbackForm, (String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          Provider.of<GreatPlaces>(context, listen: false)
              .addPlace(regnoController.text, nameController.text, widget.type);
          // Feedback is saved succesfully in Google Sheets.
          //_launchURL();
          // _showSnackbar("Suceessfully Booked ");
          AwesomeDialog(
              context: context,
              //useRootNavigator: true,
              dialogType: DialogType.SUCCES,
              title: 'Success',
              desc: 'You will Get Confirmation soon',
              btnOkOnPress: () {
                Navigator.of(context, rootNavigator: true).pop();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => MainScreen(),
                //   ),
                // );
              })
            ..show();
          /*CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            text: " Booking successful!",
            onConfirmBtnTap: () {
              Navigator.of(context, rootNavigator: true).pop();
              //Navigator.pop(context);
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ProvidedStylesExample(
              //       menuScreenContext: context,
              //     ),
              //   ),
              // );
              //Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(),
                ),
              );
            },
          );*/
          // Navigator.pop(context);
        } else {
          AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              title: 'Failed',
              desc: 'Retry Again',
              btnOkOnPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
                );
              })
            ..show();
          /* CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            text: "Booking failed!",
            onConfirmBtnTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => MainPage(),
              //   ),
              // );
              // ProvidedStylesExample(
              // menuScreenContext: context,
              //  ),
            },
          );*/
          // Error Occurred while saving data in Google Sheets.
          // _showSnackbar("Error Occurred! Try after Some time");
        }
      });
    }
  }

  /* _launchURL() async {
    const url = 'https://meet.google.com/uvs-ahhf-sto';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }*/

  // Method to show snackbar with 'message'.
  /* _showSnackbar(String message) {
    final snackBar =
        SnackBar(backgroundColor: Colors.green, content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }*/

  @override
  Widget build(BuildContext context) {
    // final String args = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(widget.title),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          ///focusNode: fc,
                          controller: nameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Valid Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(labelText: 'Name'),
                        ),
                        TextFormField(
                          //focusNode: fc,
                          controller: regnoController,
                          validator: (value) {
                            if (value.trim().length != 10) {
                              return 'Enter Phone Number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Phone number',
                          ),
                        ),
                        TextFormField(
                          //focusNode: fc,
                          controller: secController,
                          //textInputAction: ,
                          maxLines: 6,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Valid Address';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(labelText: 'Address'),
                        ),
                        TextFormField(
                          //focusNode: fc,
                          controller: issController,
                          //textInputAction: ,
                          maxLines: 2,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter correctly';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.multiline,
                          decoration:
                              InputDecoration(labelText: 'Enter food you want'),
                        ),
                      ],
                    ),
                  )),
              RaisedButton(
                color: Colors.green[300],
                textColor: Colors.white,
                //onPressed: _submitForm,
                onPressed: () {
                  // fc.unfocus();
                  FocusScope.of(context).unfocus();
                  _submitForm();
                  // _launchURL();
                },
                child: Text('Tap to Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
