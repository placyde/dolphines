import 'package:dolphins/app_localizations.dart';
import 'package:dolphins/data_base/db.dart';
import 'package:dolphins/home/home.dart';
import 'package:dolphins/login/login_action.dart';
import 'package:dolphins/redux/global_store.dart';
import 'package:dolphins/register/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SnginPages extends StatefulWidget {
  @override
  _SnginPagesState createState() => _SnginPagesState();
}

class _SnginPagesState extends State<SnginPages> {
  TextEditingController _phoneEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();
  // ignore: unused_element
  _onFetchLoginPressed() {
    print('botton pressed');
    Redux.store.dispatch(loginAction);
    print('success execute');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      'assets/images/car_wash_image.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ItemButton(
                    textO: false,
                    controller: _phoneEditingController,
                    text:
                        AppLocalizations.of(context).translate('first_string'),
                    icon: Icon(Icons.person),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ItemButton(
                    textO: true,
                    controller: _passwordEditingController,
                    text: 'Password',
                    icon: Icon(Icons.lock),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SubmitButton(
                    function: () async {
                      final database = await $FloorAppDatabase
                          .databaseBuilder('app_database.db')
                          .build();
                      final _userdao = database.userDao;
                      var userl = _userdao.findAllUser();
                      userl.then((value) async {
                        for (var i = 0; i < value.length; i++) {
                          if (_phoneEditingController.text ==
                              value[i].phoneNumber) {
                            print(value[i].name);
                            if (_passwordEditingController.text ==
                                value[i].password) {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setBool('isAuth', true);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            }
                          } else {
                            String massage =
                                "Standby created an account before logging in";
                            _showDialog(context, massage);
                          }
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text(
                  "If you don't have an account ! ",
                  style: TextStyle(
                    fontFamily: "Nirmala UI",
                    fontSize: 20,
                    color: Color(0xff666666).withOpacity(0.70),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print('Sign in button pressed');

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: new Text(
                    "Sign up",
                    style: TextStyle(
                      fontFamily: "Nirmala UI",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color(0xff54c5f8),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final Function function;
  const SubmitButton({Key key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: new Container(
        height: 52.00,
        width: 217.00,
        decoration: BoxDecoration(
          color: Color(0xff54c5f8),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.00, 3.00),
              color: Color(0xff000000).withOpacity(0.16),
              blurRadius: 6,
            ),
          ],
          borderRadius: BorderRadius.circular(25.00),
        ),
        child: Center(
          child: new Text(
            "Sign In",
            style: TextStyle(
              fontFamily: "Nirmala UI",
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Color(0xffffffff),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final bool textO;
  final TextEditingController controller;
  const ItemButton({Key key, this.text, this.icon, this.controller, this.textO})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 52.00,
      width: 350.00,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        border: Border.all(
          width: 0.50,
          color: Color(0xff878686),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00, 3.00),
            color: Color(0xff000000).withOpacity(0.05),
            blurRadius: 6,
          ),
        ],
        borderRadius: BorderRadius.circular(9.00),
      ),
      child: TextField(
        controller: controller,
        obscureText: textO,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            icon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: icon,
            ),
            suffixIcon: Icon(Icons.keyboard_hide),
            border: InputBorder.none,
            hintText: text),
      ),
    );
  }
}

void _showDialog(context, String message) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Alert Dialog "),
        content: new Text("$message"),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
