import 'package:flutter/material.dart';
import 'input.dart';

class ProdOverview extends StatelessWidget {
  final String imgUrl;
  final String descr;
  final String title;
  ProdOverview({this.imgUrl, this.descr, this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(type: title, title: 'Booking'),
              ),
            );
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => QuizPlay(id)));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            margin: EdgeInsets.symmetric(vertical: 8),
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Stack(
                children: [
                  Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    color: Colors.black26,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            descr,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
