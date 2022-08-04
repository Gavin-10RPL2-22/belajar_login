import 'package:flutter/material.dart';
import 'package:project_login/home.dart';
import 'package:project_login/register.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _user = TextEditingController();
  TextEditingController _pass = TextEditingController();
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  headerLogin(),
                  inputLogin(),
                  buttonLogin(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  inputLogin() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 20),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Colors.green,
                    )),
            child: TextFormField(
              controller: _user,
              validator: (value) {
                if (_user.text != "admin") {
                  return 'Wrong Username';
                } else if (_user.text.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              autofocus: true,
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: "EMAIL",
                  prefixIcon: Icon(Icons.email_outlined),
                  fillColor: Colors.grey[50],
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.grey.shade50))),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 10),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Colors.green,
                    )),
            child: TextFormField(
              controller: _pass,
              validator: (value) {
                value = _pass.text;
                if (value != "admin") {
                  return 'Wrong Password';
                } else if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              autofocus: true,
              style: TextStyle(color: Colors.green),
              obscureText: !_visible,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: "PASSWORD",
                  prefixIcon: IconButton(
                    icon: Icon(
                      _visible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _visible = !_visible;
                      });
                    },
                  ),
                  fillColor: Colors.grey[50],
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.grey.shade50))),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Padding(
          padding: EdgeInsets.only(left: 190, bottom: 40),
          child: Text(
            "Forgot Password?",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.green),
          ),
        ),
      ],
    );
  }

  headerLogin() {
    return Column(
      children: [
        Icon(
          Icons.account_circle_outlined,
          size: 125,
          color: Colors.grey[300],
        ),
        Text(
          "Welcome Back",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Text(
          "Sign to Continue",
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ],
    );
  }

  buttonLogin() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
            child: Text('LOGIN'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false);
              }
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green)),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have account? ",
              style: TextStyle(fontSize: 13),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Text(
                "create a new account",
                style: TextStyle(fontSize: 13, color: Colors.green),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
