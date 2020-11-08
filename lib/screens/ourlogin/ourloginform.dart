import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:marketplace/screens/oursignup/oursignup.dart';
import 'package:marketplace/states/currentuser.dart';
import 'package:marketplace/screens/home/home.dart';

// converted this into a statefull widgit because of introduction of texteditingcontrollers
class OurloginForm extends StatefulWidget {
  @override
  _OurloginFormState createState() => _OurloginFormState();
}

class _OurloginFormState extends State<OurloginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _loginUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      if (await _currentUser.loginUser(email, password)) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
        // here we display a snackbar if the password is incorrect.
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Incorrect login info'),
            duration: Duration(seconds: 3),
          ),
        );
      }
      
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
          child: Text(
            "Login to your account",
            style: TextStyle(
              color: Theme.of(context).hintColor,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // add the text input
        TextFormField(
          controller: _emailController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.alternate_email), hintText: 'Email'),
        ),
        SizedBox(height: 20),

        // for the password
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline), hintText: 'Password'),
        ),

        // login button
        SizedBox(height: 25),
        RaisedButton(
          onPressed: () {
            _loginUser(
                _emailController.text, _passwordController.text, context);
          },
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              child: Text('Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ))),
        ),

        //  the sign up link

        FlatButton(
            child: Text("Don't have account? Sign Up"),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Oursignup()));
            })
      ],
    ));
  }
}
