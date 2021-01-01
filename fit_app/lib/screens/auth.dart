import 'package:fit_app/domain/user.dart';
import 'package:fit_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthorizationPage extends StatefulWidget {
  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  String _email;
  String _password;
  bool showlogin = true;

  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          _logo(),
          SizedBox(
            height: 10,
          ),
          (showlogin
              ? Column(
                  children: [
                    _form('LOGIN', _loginButtonAction),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: GestureDetector(
                        child: Text(
                          'Not register yet? Register!',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        onTap: () {
                          setState(
                            () {
                              showlogin = false;
                            },
                          );
                        },
                      ),
                    )
                  ],
                )
              : Column(
                  children: [
                    _form('REGISTER', _registerButtonAction),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        child: Text(
                          'Already registered? Login!',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        onTap: () {
                          setState(
                            () {
                              showlogin = true;
                            },
                          );
                        },
                      ),
                    )
                  ],
                )),
          _buttomWave()
        ],
      ),
    );
  }

  Widget _logo() {
    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: Container(
        child: Align(
          child: Text(
            'MAXFIT',
            style: TextStyle(
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _form(String label, void func()) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: _input(Icon(Icons.email), 'Email', _emailcontroller, false),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child:
                _input(Icon(Icons.lock), 'Password', _passwordcontroller, true),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: _button(label, func),
          ),
        ),
      ],
    );
  }

  Widget _input(
      Icon icon, String hint, TextEditingController controller, bool obscure) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          style: TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 20,
                color: Colors.white30,
                fontWeight: FontWeight.bold),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white54, width: 1),
            ),
            prefixIcon: IconTheme(
              child: icon,
              data: IconThemeData(color: Colors.white),
            ),
          ),
        ));
  }

  Widget _button(String text, void func()) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: RaisedButton(
        splashColor: Theme.of(context).primaryColor,
        highlightColor: Theme.of(context).primaryColor,
        color: Colors.white,
        child: Text(
          text,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        onPressed: () {
          func();
        },
      ),
    );
  }

  void _loginButtonAction() async {
    _email = _emailcontroller.text;
    _password = _passwordcontroller.text;

    if (_email.isEmpty || _password.isEmpty) return;

    Users user = await _authService.signInWithEmailAndPassword(
        _email.trim(), _password.trim());

    if (user == null) {
      Fluttertoast.showToast(
          msg: "Can't sign in you,please check your email or password!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      _emailcontroller.clear();
      _passwordcontroller.clear();
    }
  }

  void _registerButtonAction() async {
    _email = _emailcontroller.text;
    _password = _passwordcontroller.text;

    if (_email.isEmpty || _password.isEmpty) return;

    Users user = await _authService.registerWithEmailAndPassword(
        _email.trim(), _password.trim());

    if (user == null) {
      Fluttertoast.showToast(
          msg: "Can't register you,please check your email or password!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      _emailcontroller.clear();
      _passwordcontroller.clear();
    }
  }

  Widget _buttomWave() {
    return Expanded(
      child: Align(
        child: ClipPath(
          child: Container(
            color: Colors.white,
            height: 300,
          ),
          clipper: BottomWaveClipper(),
        ),
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height + 5);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
