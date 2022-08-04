import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_login/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _visible = false;
  bool _visibleConfirm = false;

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
                  headerRegis(),
                  inputRegis(),
                  buttonRegis(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  headerRegis() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 290, bottom: 40, top: 30),
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false);
              },
              child: Icon(
                size: 40,
                Icons.arrow_back,
                color: Colors.green,
              )),
        ),
        Text(
          "Create Account",
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Text(
          "Create a new account",
          style: TextStyle(fontSize: 15, color: Colors.grey[700]),
        ),
      ],
    );
  }

  inputRegis() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Colors.green,
                    )),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: "NAME",
                  prefixIcon: Icon(Icons.person_outline),
                  fillColor: Colors.grey[50],
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.grey.shade50))),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Colors.green,
                    )),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
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
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Colors.green,
                    )),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: "PHONE",
                  prefixIcon: Icon(Icons.phone_android),
                  fillColor: Colors.grey[50],
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.grey.shade50))),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Colors.green,
                    )),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
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
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 50),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ThemeData().colorScheme.copyWith(
                      primary: Colors.green,
                    )),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              style: TextStyle(color: Colors.green),
              obscureText: !_visibleConfirm,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: "CONFIRM PASSWORD",
                  prefixIcon: IconButton(
                    icon: Icon(
                      _visibleConfirm ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _visibleConfirm = !_visibleConfirm;
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
      ],
    );
  }

  buttonRegis() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.8,
          child: ElevatedButton(
            child: Text('CREATE ACCOUNT'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false);
              }
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green)),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have account? ",
                style: TextStyle(fontSize: 13),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false);
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 13, color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
