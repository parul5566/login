import 'package:flutter/material.dart';

import '../Widget/my_shared_preferences.dart';
import '../main.dart';



class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  final emailText = TextEditingController();
  final passwordText = TextEditingController();

late  String email = "";
 late String password = "";

  ProfileState() {
    MySharedPreferences.instance
        .getStringValue("email")
        .then((value) => setState(() {
      email= value;
    }));
    MySharedPreferences.instance
        .getStringValue("password")
        .then((value) => setState(() {
      password = value;
    }));
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Column(

                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://www.theaa.com/cars/news/wp-content/uploads/AA-tech-pic.jpg"
                              ),
                              fit: BoxFit.cover
                          )
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        child: Container(
                          alignment: Alignment(0.0,2.5),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://www.theaa.com/cars/news/wp-content/uploads/AA-tech-pic.jpg"
                            ),
                            radius: 60.0,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      email
                      ,style: TextStyle(
                        fontSize: 25.0,
                        color:Colors.blueGrey,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w400
                    ),
                    ),

                    Card(
                      margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text("Fuel",
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text("15L",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w300
                                    ),)
                                ],
                              ),
                            ),
                            Expanded(
                              child:
                              Column(
                                children: [
                                  Text("Distance",
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text("2000KM",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w300
                                    ),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),






                /*Text(
                  "Hi" + username,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),*/
               /* SizedBox(height: 30),*/

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Password :-',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    SizedBox(width: 10,),
                    Text(
                      password,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(height: 10),

          /*      Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                      controller: controllerPassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: '{$password}'),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "* Required"),
                        MinLengthValidator(6,
                            errorText: "Password should be atleast 6 characters"),
                        MaxLengthValidator(15,
                            errorText:
                            "Password should not be greater than 15 characters")
                      ])
                    //validatePassword,        //Function to check validation
                  ),
                ),*/



/*
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)),
                        hintText: "$password"),
                    validator: (value) {
                      if (value!.isEmpty || value == null) {
                        return "{$password}";

                      } else {
                        print('data is empty');
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),*/
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Background color
                      ),
                      child: Text("Logout",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      onPressed: () {
                        MySharedPreferences.instance.removeAll();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) =>  LoginPage()));
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}




