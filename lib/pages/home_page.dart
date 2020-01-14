<<<<<<< HEAD
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:learningapp/models/course.dart';
import 'package:learningapp/pages/coursedetail.dart';
=======
import 'package:flutter/material.dart';
>>>>>>> 730c4f3a4fddb47db92e1308f29226c73a1d0fe9
import 'package:learningapp/service/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:learningapp/models/todo.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> _todoList;

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _textEditingController = TextEditingController();
  StreamSubscription<Event> _onTodoAddedSubscription;
  StreamSubscription<Event> _onTodoChangedSubscription;

<<<<<<< HEAD
  //Query _todoQuery;
=======
  Query _todoQuery;
>>>>>>> 730c4f3a4fddb47db92e1308f29226c73a1d0fe9

  //bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();

    //_checkEmailVerification();

<<<<<<< HEAD
//    _todoList = new List();
//    _todoQuery = _database
//        .reference()
//        .child("todo")
//        .orderByChild("userId")
//        .equalTo(widget.userId);
//    _onTodoAddedSubscription = _todoQuery.onChildAdded.listen(onEntryAdded);
//    _onTodoChangedSubscription =
//        _todoQuery.onChildChanged.listen(onEntryChanged);
=======
    _todoList = new List();
    _todoQuery = _database
        .reference()
        .child("todo")
        .orderByChild("userId")
        .equalTo(widget.userId);
    _onTodoAddedSubscription = _todoQuery.onChildAdded.listen(onEntryAdded);
    _onTodoChangedSubscription =
        _todoQuery.onChildChanged.listen(onEntryChanged);
>>>>>>> 730c4f3a4fddb47db92e1308f29226c73a1d0fe9
  }

////  void _checkEmailVerification() async {
////    _isEmailVerified = await widget.auth.isEmailVerified();
////    if (!_isEmailVerified) {
////      _showVerifyEmailDialog();
////    }
////  }
//
////  void _resentVerifyEmail(){
////    widget.auth.sendEmailVerification();
////    _showVerifyEmailSentDialog();
////  }
//
////  void _showVerifyEmailDialog() {
////    showDialog(
////      context: context,
////      builder: (BuildContext context) {
////        // return object of type Dialog
////        return AlertDialog(
////          title: new Text("Verify your account"),
////          content: new Text("Please verify account in the link sent to email"),
////          actions: <Widget>[
////            new FlatButton(
////              child: new Text("Resent link"),
////              onPressed: () {
////                Navigator.of(context).pop();
////                _resentVerifyEmail();
////              },
////            ),
////            new FlatButton(
////              child: new Text("Dismiss"),
////              onPressed: () {
////                Navigator.of(context).pop();
////              },
////            ),
////          ],
////        );
////      },
////    );
////  }
//
////  void _showVerifyEmailSentDialog() {
////    showDialog(
////      context: context,
////      builder: (BuildContext context) {
////        // return object of type Dialog
////        return AlertDialog(
////          title: new Text("Verify your account"),
////          content: new Text("Link to verify account has been sent to your email"),
////          actions: <Widget>[
////            new FlatButton(
////              child: new Text("Dismiss"),
////              onPressed: () {
////                Navigator.of(context).pop();
////              },
////            ),
////          ],
////        );
////      },
////    );
////  }

  @override
  void dispose() {
    _onTodoAddedSubscription.cancel();
    _onTodoChangedSubscription.cancel();
    super.dispose();
  }

  onEntryChanged(Event event) {
    var oldEntry = _todoList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _todoList[_todoList.indexOf(oldEntry)] =
          Todo.fromSnapshot(event.snapshot);
    });
  }

  onEntryAdded(Event event) {
    setState(() {
      _todoList.add(Todo.fromSnapshot(event.snapshot));
    });
  }

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  addNewTodo(String todoItem) {
    if (todoItem.length > 0) {
      Todo todo = new Todo(todoItem.toString(), widget.userId, false);
      _database.reference().child("todo").push().set(todo.toJson());
    }
  }

  updateTodo(Todo todo) {
    //Toggle completed
    todo.completed = !todo.completed;
    if (todo != null) {
      _database.reference().child("todo").child(todo.key).set(todo.toJson());
    }
  }

  deleteTodo(String todoId, int index) {
    _database.reference().child("todo").child(todoId).remove().then((_) {
      print("Delete $todoId successful");
      setState(() {
        _todoList.removeAt(index);
      });
    });
  }

  showAddTodoDialog(BuildContext context) async {
    _textEditingController.clear();
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
<<<<<<< HEAD
                  controller: _textEditingController,
                  autofocus: true,
                  decoration: new InputDecoration(
                    labelText: 'Add new todo',
                  ),
                ))
=======
                      controller: _textEditingController,
                      autofocus: true,
                      decoration: new InputDecoration(
                        labelText: 'Add new todo',
                      ),
                    ))
>>>>>>> 730c4f3a4fddb47db92e1308f29226c73a1d0fe9
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              new FlatButton(
                  child: const Text('Save'),
                  onPressed: () {
                    addNewTodo(_textEditingController.text.toString());
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  Widget showTodoList() {
    if (_todoList.length > 0) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: _todoList.length,
          itemBuilder: (BuildContext context, int index) {
            String todoId = _todoList[index].key;
            String subject = _todoList[index].subject;
            bool completed = _todoList[index].completed;
<<<<<<< HEAD
            // String userId = _todoList[index].userId;
=======
           // String userId = _todoList[index].userId;
>>>>>>> 730c4f3a4fddb47db92e1308f29226c73a1d0fe9
            return Dismissible(
              key: Key(todoId),
              background: Container(color: Colors.red),
              onDismissed: (direction) async {
                deleteTodo(todoId, index);
              },
              child: ListTile(
                title: Text(
                  subject,
                  style: TextStyle(fontSize: 20.0),
                ),
                trailing: IconButton(
                    icon: (completed)
                        ? Icon(
<<<<<<< HEAD
                            Icons.done_outline,
                            color: Colors.green,
                            size: 20.0,
                          )
=======
                      Icons.done_outline,
                      color: Colors.green,
                      size: 20.0,
                    )
>>>>>>> 730c4f3a4fddb47db92e1308f29226c73a1d0fe9
                        : Icon(Icons.done, color: Colors.grey, size: 20.0),
                    onPressed: () {
                      updateTodo(_todoList[index]);
                    }),
              ),
            );
          });
    } else {
      return Center(
          child: Text(
<<<<<<< HEAD
        "Welcome. Your list is empty",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30.0),
      ));
=======
            "Welcome. Your list is empty",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.0),
          ));
>>>>>>> 730c4f3a4fddb47db92e1308f29226c73a1d0fe9
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
<<<<<<< HEAD
      appBar: new AppBar(
        title: new Text('Flutter login demo'),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: signOut)
        ],
      ),
      body:Padding(
        padding: EdgeInsets.all(16.0),
            child: MyStatelessWidget()
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  Future getAllCourses() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection('course').getDocuments();
    return qn.documents;
  }


  @override
  Widget build(BuildContext context) {
    return Container(


            child: FutureBuilder(
                future: getAllCourses(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Text("loading..."),
                    );
                  } else {
                    return ListView.builder(
//                     padding: const EdgeInsets.all(8),
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, index) {
                          return Container(
                              child: Card(
                                child:InkWell(
                                  onTap: () {
                                                  final Course course= Course( courseName : (snapshot.data[index].data["name"]).toString(),courseDescription : snapshot.data[index].data["description"],courseImage :snapshot.data[index].data["imageurl"]);
                          
                                          
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetail(course : course,),
                  // Pass the arguments as part of the RouteSettings. The
                  // DetailScreen reads the arguments from these settings.
              
                ),
              );
            

                                        },

                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                new Image.network(
                                    snapshot.data[index].data["imageurl"]),
                                
                                ListTile(
                                  title: Text(snapshot.data[index].data[
                                      "name"]), // height: 50,                         color: Colors.amber[colorCodes[index]],
                                  subtitle: Text(
                                      snapshot.data[index].data["description"]),
                                ),
                                ButtonBar(
                                    children: <Widget>[
                                     
                                      RaisedButton(
                                        child: const Text('DETAILS'),
                                        onPressed: () {
                                                  final Course course= Course( courseName : (snapshot.data[index].data["name"]).toString(),courseDescription : snapshot.data[index].data["description"],courseImage :snapshot.data[index].data["imageurl"]);
                          
                                          
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetail(course : course,),
                  // Pass the arguments as part of the RouteSettings. The
                  // DetailScreen reads the arguments from these settings.
              
                ),
              );
            

                                        },
                                      ),
                                    ],
                                    alignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max),
                              ],
                            ),
                          
                          )
                              /*   Card(
      child: new Column(
        children: <Widget>[
         // child: Image.network(snapshot.data[index].data["imageurl"]),
          new Image.network(snapshot.data[index].data["imageurl"]),
           Text(snapshot.data[index].data["name"]),
            Text(snapshot.data[index].data["description"]),
=======
        appBar: new AppBar(
          title: new Text('Flutter login demo'),
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
        ),
        body:new MyStatelessWidget(),

        );
  }
}
class MyStatelessWidget extends StatelessWidget {
 MyStatelessWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
                new Image.asset('images/logo.jpg'),
               Container(
          padding: EdgeInsets.all(0),
        ),
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('BUY COURSE'),
                  onPressed: () {/* ... */},
                ),
                FlatButton(
                  child: const Text('DETAILS'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  new Card(
      child: new Column(
        children: <Widget>[
          new Image.asset('images/logo.jpg'),
>>>>>>> 730c4f3a4fddb47db92e1308f29226c73a1d0fe9
          new Padding(
              padding: new EdgeInsets.all(7.0),
              child: new Row(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child: new Icon(Icons.thumb_up),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child: new Text('Like',style: new TextStyle(fontSize: 18.0),),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child: new Icon(Icons.comment),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child: new Text('Comments',style: new TextStyle(fontSize: 18.0)),
                  )

                ],
              )
          )
        ],
      ),
<<<<<<< HEAD
    )
          */
                           ) );
                        });
                  }
                }));
  }
}
=======
    );
  }
}
>>>>>>> 730c4f3a4fddb47db92e1308f29226c73a1d0fe9
