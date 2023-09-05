import 'package:flutter/material.dart';
import 'package:google_sign/controllerLogin.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//Google Sign
final GoogleSignIn gSignIn = GoogleSignIn();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: loginUiController(),
    );
  }

//Login Ui Controller
  loginUiController() {
    return Consumer<ControllerLogin>(builder: (context, model, child) {
      // if user already loggedIn
      if (model.googleUser != null) {
        return Center(
            //show user details
            child: alreadyLoggedInScreen(model));
      }
      // if user not loggedIn
      else {
        //Show SignIn Screen
        return notLoggedInScreen();
      }
    });
  }

//For NotLoggedInScreen
  notLoggedInScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset("assets/images/social.jpg"),
          ),
          GestureDetector(
            onTap: () {
              Provider.of<ControllerLogin>(context, listen: false)
                  .allowUserToLogin();
            },
            child: Image.asset("assets/images/google.png",width: 250,),
          )
        ],
      ),
    );
  }

//Already LoggedInScreen
  alreadyLoggedInScreen(ControllerLogin model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: Image.network('${model.googleUser!.photoUrl}').image,
          radius: 100,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              color: Colors.black,
            ),
            const SizedBox(width: 20),
            Text(
              "${model.googleUser!.displayName}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.mail,
              color: Colors.black,
            ),
            const SizedBox(width: 20),
            Text(
              "${model.googleUser!.email}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            )
          ],
        ),
        const SizedBox(height: 20),
        ActionChip(
            backgroundColor: Colors.black,
            avatar: const Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Icon(Icons.logout, color: Colors.white),
            ),
            label: const Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Text("Logout",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
            onPressed: () {
              Provider.of<ControllerLogin>(context,listen: false).allowUserToLogout();
            },)
      ],
    );
  }
}
