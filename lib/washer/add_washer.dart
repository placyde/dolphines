
import 'package:dolphins/entity/entity.dart';
import 'package:dolphins/redux/global_store.dart';
import 'package:dolphins/washer/add_washer_action.dart';
import 'package:flutter/material.dart';

class AddWasherPage extends StatefulWidget {
  @override
  _AddWasherPageState createState() => _AddWasherPageState();
}

class _AddWasherPageState extends State<AddWasherPage> {
  TextEditingController _fnameEditingController = TextEditingController();
  TextEditingController _lnameEditingController = TextEditingController();
  TextEditingController _aliasEditingController = TextEditingController();
  TextEditingController _cniEditingController = TextEditingController();
  TextEditingController _phoneEditingController = TextEditingController();
  TextEditingController _matriculeEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new washer")),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(children: <Widget>[
              TextFieldItemElement(
                title: 'First Name',
                controller: _fnameEditingController,
              ),
              TextFieldItemElement(
                title: "Last Name",
                controller: _lnameEditingController,
              ),
              TextFieldItemElement(
                title: 'Alias',
                controller: _aliasEditingController,
              ),
              TextFieldItemElement(
                title: 'CNI Number',
                controller: _cniEditingController,
              ),
              TextFieldItemElement(
                title: "Phone Number",
                controller: _phoneEditingController,
              ),
              TextFieldItemElement(
                title: "matricule",
                controller: _matriculeEditingController,
              ),
              ElementSubmitItem(
                function: () async {
                  print('Button pressed');
                  CarWasher carWasher;
                  carWasher = CarWasher(
                      fisrtName: _fnameEditingController.text,
                      lastName: _lnameEditingController.text,
                      alias: _aliasEditingController.text,
                      cniNumber: _cniEditingController.text,
                      phone: _phoneEditingController.text,
                      matricule: _matriculeEditingController.text,
                      picture: 'sfqdqgqd');
                  Redux.store.dispatch(AddWasherAction(washer: carWasher));
                  Redux.store.dispatch(fetchCarWasherAction);
                  Navigator.pop(context);
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class ElementSubmitItem extends StatelessWidget {
  final Function function;
  const ElementSubmitItem({Key key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: new Container(
          height: 55.00,
          width: 250.00,
          decoration: BoxDecoration(
            color: Color(0xff54c5f8),
            boxShadow: [
              BoxShadow(
                offset: Offset(0.00, 2.00),
                color: Color(0xff000000).withOpacity(0.2),
                blurRadius: 6,
              ),
            ],
            borderRadius: BorderRadius.circular(25.00),
          ),
          child: Center(
            child: new Text(
              "Save",
              style: TextStyle(
                fontFamily: "Nirmala UI",
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldItemElement extends StatelessWidget {
  final String title;
  final Icon icon;
  final TextEditingController controller;
  const TextFieldItemElement({Key key, this.title, this.icon, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: new Container(
        height: 55.00,
        width: 360.00,
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
          style: TextStyle(
            fontFamily: "Nirmala UI",
            fontSize: 20,
            color: Color(0xff666666).withOpacity(0.70),
          ),
          decoration: InputDecoration(
              icon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: icon,
              ),
              border: InputBorder.none,
              hintText: '$title'),
        ),
      ),
    );
  }
}
