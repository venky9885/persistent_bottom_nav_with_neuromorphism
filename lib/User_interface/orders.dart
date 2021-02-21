import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import './add_place_screen.dart';
import '../database/provider.dart';
//import './place_detail_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.add),
        //     onPressed: () {
        //       Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
        //     },
        //   ),
        // ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: const Text('Got no orders yet, start placing order!'),
                ),
                builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
                    ? ch
                    : Align(
                        alignment: Alignment.topCenter,
                        child: ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          itemCount: greatPlaces.items.length,
                          itemBuilder: (ctx, i) => Card(
                            color: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.green[300], width: 1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ListTile(
                              leading:
                                  Text("Type: ${greatPlaces.items[i].type}"),
                              // leading: if(type==''){
                              //   Icon(Icons.local_florist_outlined)
                              // }else if(type==''){
                              //   Icon(Icons.)
                              // }else{
                              //   Icon(Icons.)
                              // },
                              // CircleAvatar(
                              //   backgroundImage: FileImage(
                              //     greatPlaces.items[i].image,
                              //   ),
                              // ),
                              title: Text("Name: ${greatPlaces.items[i].name}"),
                              subtitle: Text(
                                  "Phone number: ${greatPlaces.items[i].number}"),
                              onTap: () {
                                // Navigator.of(context).pushNamed(
                                //   PlaceDetailScreen.routeName,
                                //   arguments: greatPlaces.items[i].id,
                                // );
                              },
                            ),
                          ),
                        ),
                      ),
              ),
      ),
    );
  }
}
