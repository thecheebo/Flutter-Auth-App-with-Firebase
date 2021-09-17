import 'package:flutter/material.dart';
import 'package:interactive_chart/services/auth.dart';
import 'package:interactive_chart/shared/constants.dart';
import 'package:interactive_chart/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({required this.toggleView});


  @override  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService(); // not changing in future
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // Initially password is obscure
  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        backgroundColor: Colors.purple[400],

        elevation: 5.0,
        title: Text("Log In"),
        actions: <Widget>[
          FlatButton.icon(
              icon:Icon(Icons.person),
              label: Text('Sign Up'),
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
                validator: (val) => val!.isEmpty ? 'Email' : null,

                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height:25.0),

              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: _obscureText,
                validator: (val) => val!.length < 6 ? 'Password must be at least 6 characters' : null,

                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              FlatButton(
                  onPressed: _toggle,
                  child: new Text(_obscureText ? "Show Password" : "Hide")),
              SizedBox(height:30.0,),


              RaisedButton(




                color: Colors.pink[400],
                child: Text(
                  'sign in',
                  style: TextStyle(color: Colors.white),

                ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.signInWithEmailandPassword(email, password);

                      if (result == null) {
                        setState(() {
                          error = 'Credentials were not valid';
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

              ),




            ],
          ),
        ),
      ),
    );
  }
}
