import 'package:dolphins/carWash/car_wash_action.dart';
import 'package:dolphins/entity/entity.dart';
import 'package:dolphins/redux/global_store.dart';
import 'package:dolphins/setting/carType/carType_action.dart';
import 'package:dolphins/washer/add_washer_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AddCarWash extends StatefulWidget {
  @override
  _AddCarWashState createState() => _AddCarWashState();
}
int washer;
int carType;
class _AddCarWashState extends State<AddCarWash> {
  TextEditingController _matriculeEditingController = TextEditingController();
  TextEditingController _priceEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new wash')),
      floatingActionButton: SubmitButtonItem(
        function: () {
          CarWash carWash = CarWash(
        matricule: _matriculeEditingController.text,
        washPrice: _priceEditingController.text,
        washer: washer,
        cartypeownerId: carType,
        ownerId: 1
      );
      Redux.store.dispatch(AddCarWashAction(carWash: carWash));
          _priceEditingController.clear();
          _matriculeEditingController.clear();
          Redux.store.dispatch(fetchCarWashAction);
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                TextFieldItem(
                  controller: _matriculeEditingController,
                  icon: Icon(Icons.branding_watermark),
                  title: "Car matricule",
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFieldItem(
                  controller: _priceEditingController,
                  icon: Icon(Icons.monetization_on),
                  title: "Wash price",
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
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
                   child: DropDownItemCust()),
                   SizedBox(height: 20.0,),
                   Container(
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
                   child: DropDownItemCarType())
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubmitButtonItem extends StatelessWidget {
  final Function function;
  const SubmitButtonItem({Key key, this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: new Container(
        height: 55.00,
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
            "Next",
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

class TextFieldItem extends StatelessWidget {
  final Icon icon;
  final String title;
  final TextEditingController controller;
  const TextFieldItem({Key key, this.icon, this.title, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
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
        decoration: InputDecoration(
            icon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: icon,
            ),
            border: InputBorder.none,
            hintText: '$title'),
      ),
    );
  }
}

class DropDownItemCust extends StatefulWidget {
  @override
  _DropDownItemCustState createState() => _DropDownItemCustState();
}

class _DropDownItemCustState extends State<DropDownItemCust> {
String _dropDownValue;

  showWasher() {
    Redux.store.dispatch(fetchCarWasherAction);
  }

  @override
  Widget build(BuildContext context) {
    showWasher();
    return StoreProvider<AppState>(
      store: Redux.store,
      child: StoreConnector<AppState, Future<List<CarWasher>>>(
        distinct: true,
        converter: (store) => store.state.addWasherState.carWasher,
        builder: (context, store) => FutureBuilder(
            future: store,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButton(
                  hint: _dropDownValue == null
                      ? Text('Washer Name')
                      : Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text(
                            _dropDownValue,
                            style: TextStyle(color: Colors.blue, fontSize: 18,),
                          ),
                      ),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: TextStyle(color: Colors.blue, fontSize: 18,),
                  items: snapshot.data.map<DropdownMenuItem<CarWasher>>(
                    (val) {
                      return DropdownMenuItem<CarWasher>(
                        value: val,
                        child: Text('${val.fisrtName}'),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                      () {
                        _dropDownValue = val.fisrtName;
                        washer = val.id;
                      },
                    );
                  },
                );
              }
              if (snapshot.data == null) {
                return Center(child: Text('No Washer'));
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}


class DropDownItemCarType extends StatefulWidget {
  @override
  DropDownItemCarTypeState createState() => DropDownItemCarTypeState();
}

class DropDownItemCarTypeState extends State<DropDownItemCarType> {
String _dropDownValue;

  showWasher() {
    Redux.store.dispatch(fetchCarTypeAction);
  }

  @override
  Widget build(BuildContext context) {
    showWasher();
    return StoreProvider<AppState>(
      store: Redux.store,
      child: StoreConnector<AppState, Future<List<CarType>>>(
        distinct: true,
        converter: (store) => store.state.carTypeState.carType,
        builder: (context, store) => FutureBuilder(
            future: store,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButton(
                  hint: _dropDownValue == null
                      ? Text('Car type')
                      : Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text(
                            _dropDownValue,
                            style: TextStyle(color: Colors.blue, fontSize: 18,),
                          ),
                      ),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: TextStyle(color: Colors.blue, fontSize: 18,),
                  items: snapshot.data.map<DropdownMenuItem<CarType>>(
                    (val) {
                      return DropdownMenuItem<CarType>(
                        value: val,
                        child: Text('${val.typeName}'),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                      () {
                        _dropDownValue = val.fisrtName;
                        carType = val.id;
                      },
                    );
                  },
                );
              }
              if (snapshot.data == null) {
                return Center(child: Text('No Car Type'));
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
