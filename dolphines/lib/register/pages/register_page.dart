
import 'package:dolphins/entity/entity.dart';
import 'package:dolphins/redux/global_store.dart';
import 'package:dolphins/register/register_action.dart';
import 'package:dolphins/register/register_state.dart';
import 'package:flutter/material.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool monVal1 = false;
  bool monVal2 = false;
  String genre;
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _phoneEditingController = TextEditingController();
  TextEditingController _passwordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                    ItemField(
                      controller: _nameEditingController,
                      title: "Full name",
                      icon: Icon(Icons.person),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ItemField(
                      controller: _emailEditingController,
                      title: "Email",
                      icon: Icon(Icons.email),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ItemField(
                      controller: _phoneEditingController,
                      title: "Phone",
                      icon: Icon(Icons.phone),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ItemField(
                      controller: _passwordEditingController,
                      title: "Password",
                      icon: Icon(Icons.lock),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: monVal1,
                          onChanged: (bool value) {
                            setState(() {
                              monVal1 = value;
                              monVal2 = false;
                            });
                          },
                        ),
                        Text('Manager',
                            style: TextStyle(
                              fontFamily: "Nirmala UI",
                              fontSize: 20,
                              color: Color(0xff666666).withOpacity(0.70),
                            )),
                        SizedBox(
                          width: 80,
                        ),
                        Checkbox(
                          value: monVal2,
                          onChanged: (bool value) {
                            setState(() {
                              monVal2 = value;
                              monVal1 = false;
                            });
                          },
                        ),
                        Text('CEO',
                            style: TextStyle(
                              fontFamily: "Nirmala UI",
                              fontSize: 20,
                              color: Color(0xff666666).withOpacity(0.70),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SubmitItem(
                      function: () async {
                        createUserPressd(
                            context,
                            _nameEditingController.text,
                            _passwordEditingController.text,
                            _phoneEditingController.text,
                            genre,
                            _emailEditingController.text);
                        _nameEditingController.clear();
                        _passwordEditingController.clear();
                        _phoneEditingController.clear();
                        _emailEditingController.clear();
                      },
                    ),
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text(
                  "Already have an account ?  ",
                  style: TextStyle(
                    fontFamily: "Nirmala UI",
                    fontSize: 20,
                    color: Color(0xff666666).withOpacity(0.70),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: new Text(
                    "Sign in",
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

final snackBar = SnackBar(content: CircularProgressIndicator());

class SubmitItem extends StatelessWidget {
  final Function function;
  const SubmitItem({Key key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('register button pressed');
      },
      child: InkWell(
        onTap: function,
        child: new Container(
          height: 52.00,
          width: 250.00,
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
            "Continue",
            style: TextStyle(
              fontFamily: "Nirmala UI",
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Color(0xffffffff),
            ),
          )),
        ),
      ),
    );
  }
}

class ItemField extends StatelessWidget {
  final String title;
  final Icon icon;
  final TextEditingController controller;
  const ItemField({Key key, this.title, this.icon, this.controller})
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
            color: Color(0xff000000).withOpacity(0.06),
            blurRadius: 6,
          ),
        ],
        borderRadius: BorderRadius.circular(9.00),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            icon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: icon,
            ),
            border: InputBorder.none,
            hintText: title),
      ),
    );
  }
}

// ignore: unused_element
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

createUserPressd(context, String name, String password, String phoneNumber,
    String userType, String email) {
  Redux.store
      .dispatch(SetRegiterStateAction(RegisterState(isRegisterLoading: true)));
  final user = User(
      name: name,
      password: password,
      phoneNumber: phoneNumber,
      userType: userType,
      email: email);
  Redux.store.dispatch(AddItemAction(user: user));
  Redux.store
      .dispatch(SetRegiterStateAction(RegisterState(isRegisterLoading: false)));
  Navigator.pop(context);
}
