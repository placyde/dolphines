
import 'package:dolphins/entity/entity.dart';
import 'package:dolphins/redux/global_store.dart';
import 'package:dolphins/setting/carType/carType_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CarTypeSetingPage extends StatefulWidget {
  @override
  _CarTypeSetingPageState createState() => _CarTypeSetingPageState();
}

class _CarTypeSetingPageState extends State<CarTypeSetingPage> {
  showData() {
    Redux.store.dispatch(fetchCarTypeAction);
  }

  @override
  Widget build(BuildContext context) {
    showData();
    return Scaffold(
      appBar: AppBar(title: Text('Car Types'), actions: [
        InkWell(
            onTap: () async {
              print('Button add car type pressed');
              _showDialog(context);
            },
            child: Icon(Icons.add, size: 30))
      ]),
      body: StoreProvider<AppState>(
        store: Redux.store,
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Container(
            child: StoreConnector<AppState, Future<List<CarType>>>(
              distinct: true,
              converter: (store) => store.state.carTypeState.carType,
              builder: (context, store) => FutureBuilder(
                  future: store,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        reverse: true,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var item = snapshot.data[index].typeName;
                          return Card(
                            elevation: 1,
                            child: ListTile(
                                title: Text(
                              '$item',
                              style: TextStyle(fontSize: 18),
                            )),
                          );
                        },
                      );
                    }
                    if (snapshot.data == null) {
                    return Center(child: Text('No data'));
                  }
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

void _showDialog(context) {
  // flutter defined function
  TextEditingController _nameEditingController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Create a Car Type"),
        content: new Container(
          child: TextField(
            controller: _nameEditingController,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Enter a Car type'),
          ),
        ),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          new FlatButton(
            child: new Text("Valid"),
            onPressed: () async {
              if (_nameEditingController.text == null) {
                Navigator.of(context).pop();
              }
              CarType data;
              data = CarType(typeName: _nameEditingController.text);
              Redux.store.dispatch(AddCarTypeAction(carType: data));
              Redux.store.dispatch(fetchCarTypeAction);
              _nameEditingController.clear();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
