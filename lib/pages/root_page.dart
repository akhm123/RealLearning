import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:learningapp/pages/admincourse.dart';
=======
>>>>>>> 730c4f3a4fddb47db92e1308f29226c73a1d0fe9
import 'login_signup_page.dart';
import 'package:learningapp/service/authentication.dart';
import 'home_page.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class RootPage extends StatefulWidget {
  RootPage({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";
<<<<<<< HEAD
String _u;
=======

>>>>>>> 730c4f3a4fddb47db92e1308f29226c73a1d0fe9
  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        authStatus =
        user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  void loginCallback() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
<<<<<<< HEAD
        print('hello');
        print(user.email);
        _u=user.email;
=======
>>>>>>> 730c4f3a4fddb47db92e1308f29226c73a1d0fe9
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return new LoginSignupPage(
          auth: widget.auth,
          loginCallback: loginCallback,
        );
        break;
      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null) {
<<<<<<< HEAD
          print("hi");
          print(_userId);
          if(_u=='ashish@gmail.com') {
             return new AdminCourse(userId: _userId,
               auth: widget.auth,
               logoutCallback: logoutCallback,);

          }
          else
            {
              return new HomePage(
                userId: _userId,
                auth: widget.auth,
                logoutCallback: logoutCallback,
              );
            }
=======
          return new HomePage(
            userId: _userId,
            auth: widget.auth,
            logoutCallback: logoutCallback,
          );
>>>>>>> 730c4f3a4fddb47db92e1308f29226c73a1d0fe9
        } else
          return buildWaitingScreen();
        break;
      default:
        return buildWaitingScreen();
    }
  }
}