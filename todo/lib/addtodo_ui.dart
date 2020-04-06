import 'package:flutter/material.dart';

class AddTodoPage extends StatefulWidget {
  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  String name;
  String description;
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add Todo")),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Title",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))),
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  helperText: ' ',
                  contentPadding: EdgeInsets.all(0),
                  hintText: 'Title',
                  hintStyle: TextStyle(fontSize: 14, color: Colors.white)),
              validator: (val) => val.length == 0 ? 'Enter Todo' : null,
              onSaved: (val) => name = val,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Description",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))),
            TextFormField(
              controller: descriptionController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  helperText: ' ',
                  contentPadding: EdgeInsets.all(0),
                  hintText: 'Description',
                  hintStyle: TextStyle(fontSize: 14, color: Colors.white)),
              validator: (val) => val.length == 0 ? 'Enter Todo' : null,
              onSaved: (val) => description = val,
            ),
            RaisedButton(
              padding: EdgeInsets.all(8),
              child: Text("Save"),
              highlightColor: Colors.deepPurple,
            )
          ]),
        ));
  }
}
