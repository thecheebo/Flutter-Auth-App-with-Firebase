import 'package:flutter/material.dart';
import 'package:interactive_chart/services/auth.dart';
import 'package:interactive_chart/shared/constants.dart';
import 'package:interactive_chart/shared/loading.dart';

class Register extends StatefulWidget {
  //Register({Key? key}) : super(key: key);

  Function toggleView;
  Register({required
  this.toggleView});


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService(); // not changing in future
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.purple[800],
      appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent[400],
          elevation: 0.0,
          title: Text("Sign Up" , style: TextStyle(
              color: Colors.purple[800]
          )),
          actions: <Widget>[
            FlatButton.icon(
            icon:Icon(Icons.person, color: Colors.green[400],),

              label: Text('Already have an account'),
              onPressed: () {
                widget.toggleView();
              }
    ),
    ],

      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 25.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val!.isEmpty ? 'Enter a valid email address' : null,
                onChanged: (val) {
                  setState(() => email = val);

                },
              ),
              SizedBox(height:25.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),

                obscureText: true,
                validator: (val) => val!.length < 8 ? 'Password must be at least 8 characters' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height:30.0),
              RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),

                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() {
                          error = 'Please provide a valid email';
                          loading = false;
                        });

                      }
                    }
                  }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),

              )
            ],
          ),
        ),
      ),
    );




  }
}
