import 'package:dolphins/entity/entity.dart';
import 'package:dolphins/redux/global_store.dart';
import 'package:dolphins/setting/washType/washTypeAction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AddWashTypePage extends StatefulWidget {
  @override
  _AddWashTypePageState createState() => _AddWashTypePageState();
}

class _AddWashTypePageState extends State<AddWashTypePage> {
  showWashType() async {
    Redux.store.dispatch(fetchWashTypeAction);
  }

  @override
  Widget build(BuildContext context) {
    showWashType();
    return StoreProvider<AppState>(
      store: Redux.store,
          child: Scaffold(
        appBar: AppBar(
          title: Text("Add Wash Type"),
          actions: [
            InkWell(
                onTap: () {
                  _showDialog(context);
                },
                child: Icon(Icons.add, size: 30))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Container(
            child:  StoreConnector<AppState, Future<List<WashType>>>(
              distinct: true,
              converter: (store) => store.state.washTypeState.washType,
                          builder: (context, store) => FutureBuilder(
                future: store,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          var item = snapshot.data[index].washName;
                          var subItem = snapshot.data[index].washPrice;
                          return Card(
                            elevation: 1,
                            child: ListTile(
                            title: Text('$item', style: TextStyle(fontSize:20),),
                            trailing: Text('$subItem',style: TextStyle(fontSize:20)),
                          ),);
                        });
                  }
                  if (snapshot.data == null) {
                    return Center(child: Text('No data'));
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
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
  TextEditingController _priceEditingController = TextEditingController();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Create a new wash type"),
        content: Container(
          height: MediaQuery.of(context).size.height / 8,
          child: Column(
            children: [
              new Container(
                child: TextField(
                  controller: _nameEditingController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Enter a Wash type'),
                ),
              ),
              new Container(
                child: TextField(
                  controller: _priceEditingController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter price of Wash type'),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          new FlatButton(
            child: new Text("Valid"),
            onPressed: () async {
              if (_nameEditingController.text == null) {
                _nameEditingController.clear();
                _priceEditingController.clear();
                Navigator.of(context).pop();
              }
              
              WashType washType;
              washType = WashType(
                  washName: _nameEditingController.text,
                  washPrice: _priceEditingController.text);
              Redux.store.dispatch(AddWashTypeAction(washType:washType));
              _nameEditingController.clear();
              _priceEditingController.clear();
              Redux.store.dispatch(fetchWashTypeAction);
              Navigator.of(context).pop();

            },
          ),
        ],
      );
    },
  );
}
