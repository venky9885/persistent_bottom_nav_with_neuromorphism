import 'package:flutter/foundation.dart';

class Place {
  final String id;
  final String number;
  final String name;
  final String type;

  Place({
    @required this.id,
    @required this.number,
    @required this.name,
    @required this.type,
  });
}
/*Provider.of<GreatPlaces>(context, listen: false)
              .addPlace(regnoController.text, nameController.text, widget.type);*/
/*
 CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            text: " Booking successful!",
            onConfirmBtnTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => MainPage(),
              //   ),
              // );
            },
          );
 CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            text: "Booking failed!",
            onConfirmBtnTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ),
              );
            },
          );
          */
