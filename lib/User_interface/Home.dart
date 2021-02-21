import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../model/dat.dart';
import '../model/model.dart';
import 'product.dart';
//import './persistent_bottom.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;
  MainScreen(
      {Key key,
      this.menuScreenContext,
      this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);
  final Data das = Data();
  List<Model> imh;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 155,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.grey,
          body: ListView.builder(
            itemCount: das.dat.length,
            itemBuilder: (ctx, index) {
              return ProdOverview(
                title: das.dat[index].title,
                descr: das.dat[index].descr,
                imgUrl: das.dat[index].imgUrl,
              );
            },
          ),
          //]),
          //floatingActionButton: FloatingActionButton(
          // onPressed: () {},
          //tooltip: 'Increment',
          // child: Icon(Icons.add),
          //),
        ),
      ),
      //),
    );
  }
}

class MainScreen2 extends StatelessWidget {
  const MainScreen2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.indigo,
                onPressed: () {
                  launch(('tel:+91 9100206262'));
                  // pushNewScreen(context, screen: MainScreen3());
                },
                child: Text(
                  "Make a call to get Groceries",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                  //style: TextStyle(color: Colors.white),
                ),
              ),
              /*RaisedButton(
                color: Colors.indigo,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Go Back to First Screen",
                  style: TextStyle(color: Colors.white),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreen3 extends StatelessWidget {
  const MainScreen3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        child: Center(
          child: RaisedButton(
            color: Colors.indigo,
            onPressed: () {
              //Navigator.pop(context);
            },
            child: Text(
              "Not Yet implemented Will be out soon\n                       In next Version",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
