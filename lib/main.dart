import 'package:flutter/material.dart';
import 'package:learningapp/service/authentication.dart';
import 'package:learningapp/pages/root_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter login demo',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
<<<<<<< HEAD
          primarySwatch: Colors.blue,
        ),
        home: new RootPage(auth: new Auth()));
  }
}
=======
          primarySwatch: Colors.orange,
        ),
        home: new RootPage(auth: new Auth()));
  }
}
>>>>>>> 730c4f3a4fddb47db92e1308f29226c73a1d0fe9
