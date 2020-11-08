import 'package:flutter/material.dart';
import 'package:marketplace/screens/ourlogin/login.dart';
import 'package:marketplace/states/currentuser.dart';
import 'package:provider/provider.dart';
// import 'package:marketplace/screens/home/home.dart';



class OursignupForm extends StatefulWidget {
  @override
  _OursignupFormState createState() => _OursignupFormState();
}

// What we have done here :> 
// first we changed the stateless widget to statefull widget
// and we have brought in four TextEditingControllers
// and now we add each to its individual form field.

class _OursignupFormState extends State<OursignupForm> {
  TextEditingController  _fullNameController = TextEditingController();
  TextEditingController  _emailController = TextEditingController();
  TextEditingController  _passwordController = TextEditingController();
  TextEditingController  _confirmpasswordController = TextEditingController();


  void _signUpUser(String email, String password, BuildContext context)  async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try{
      if(await _currentUser.signUpUser(email, password)) {
        Navigator.pop(context);
      }
    }catch(e){
      print(e);
    }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(
            vertical:
            20.0, horizontal:8.0
          ),
          child: Text(
            "Create account", 
            style: TextStyle(color: Theme.of(
              context
            ).hintColor,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,

            ),
          ),
        ),

  // add the text input
        TextFormField(
          controller: _fullNameController,
          decoration: InputDecoration(
            prefixIcon:Icon(
              Icons.account_box
            ),
            hintText: 'Full name'),

          ),
          SizedBox(height: 20),

        // add the text input
        TextFormField(
          controller: _emailController,

          decoration: InputDecoration(
            prefixIcon:Icon(
              Icons.alternate_email
            ),
            hintText: 'Email'),

          ),

          SizedBox(height: 20),

          // for the password
          TextFormField(
          controller: _passwordController,

            decoration: InputDecoration(
              prefixIcon:Icon(
                Icons.lock_outline),
                hintText: 'Password'
              ),
            ),
             SizedBox(height: 20),

          // for the password
          TextFormField(
          controller: _confirmpasswordController,

            decoration: InputDecoration(
              prefixIcon:Icon(
                Icons.lock_outline_rounded),
                hintText: 'Comfirm Password'
              ),
            ),
                    
          SizedBox(height: 25),
          // login button
          RaisedButton(
            onPressed: () {
            // just making sure that the password and confirm password are the same.
            // now lets create this signUpUser function, above 
              if(_passwordController.text == _confirmpasswordController.text){
                _signUpUser(_emailController.text, _passwordController.text, context);
                 
                    }  

                    
                    else{
                      Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("Password do not match"),
                        duration: Duration(seconds: 2),
                      ),
                      );
                    }  
                  },
      
                  child: Padding(padding: EdgeInsets.symmetric(
                    horizontal: 60, vertical: 10),
                    child: Text('Signup', style: TextStyle(
                      color: Colors.black,
                      fontWeight:
                      FontWeight.bold,
                      fontSize:20,
                      
      
                    )
                    )
                  ),
                  
                  ),
                  
                            
                 //  the sign up link
                
                       FlatButton(
                          child: Text("Already have an account? login"),
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                
                          onPressed: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Ourlogin()
                
                              
                              )
                            );
                          } 
                        )
                          
                            
                        
                
                      ],
                      ) 
                    );
                  }
                }
                
                
