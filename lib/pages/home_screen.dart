import 'package:flutter/material.dart';
import 'package:login/Widget/toggle_button.dart';

import '../Widget/data_show.dart';
import 'location_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home Page'),
      ),*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          SizedBox(
              height: 500,
              child:  LocationPage()),
          Center(
            child: SizedBox(
                width: 150,
                height: 40,
                child: DataShow()),
          ),
        ],
      ),
    );
  }
}