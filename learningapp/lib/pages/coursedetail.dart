import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningapp/models/course.dart';

class CourseDetail extends StatelessWidget {
  final Course course;
  CourseDetail({this.course});
  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(course.courseName),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
            child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.pageview),
                  title: Text('Course Overview'),
                  subtitle: Text('${course.courseOverView}')),
              new Image.network('${course.courseImage}'),
              Container(
                padding: EdgeInsets.all(0),
              ),
              ListTile(
                title: Text(' ${course.courseName}'),
                subtitle: Text(' ${course.courseDescription}'),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
