import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginScreen extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void authenticate(BuildContext context) async {
    String username = usernameController.text;
    String password = passwordController.text;
    var res = await http.post('http://10.100.106.45:3000/users/login',
        body: {'email': username, 'password': password});
    var json = convert.jsonDecode(res.body);

    if (res.statusCode == 200) {
      String name = json['name'];
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          "Welcome  $name",
          style: TextStyle(color: Colors.green),
        ),
      ));
    } else {
      String msg = json['msg'];
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          msg,
          style: TextStyle(color: Colors.red),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                labelText: "Password",
                prefixIcon: Icon(Icons.vpn_key),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            RaisedButton(
              padding: EdgeInsets.all(10),
              color: Colors.lightGreen,
              textColor: Colors.white,
              shape: StadiumBorder(),
              onPressed: () {
                print("working click");
                authenticate(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.art_track),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }));
  }
}
