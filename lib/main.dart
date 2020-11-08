import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:marketplace/states/currentuser.dart';
import 'package:provider/provider.dart';
import 'package:marketplace/screens/ourlogin/login.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {

    // wrap this with a widget and give it a class  ChangeNotifierProvider
    return ChangeNotifierProvider(
      
      // we need the create property and pass in the CurrentUser
      // so that the whole app will have access to the current user state
      create: (context)=> CurrentUser(), 
          child: MaterialApp(
          home:Ourlogin(),


        
        
          
      ),
    );
  }
}
