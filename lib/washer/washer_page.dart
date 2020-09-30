import 'package:dolphins/data_base/db.dart';
import 'package:dolphins/entity/entity.dart';
import 'package:dolphins/redux/global_store.dart';
import 'package:dolphins/washer/add_washer.dart';
import 'package:dolphins/washer/add_washer_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class WashersPage extends StatefulWidget {
  @override
  _WashersPageState createState() => _WashersPageState();
}

class _WashersPageState extends State<WashersPage> {
  void _onFetchPostsPressed() {
    Redux.store.dispatch(fetchCarWasherAction);
  }

  @override
  void initState() {
    
    setState(() {
      _onFetchPostsPressed();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Washers'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddWasherPage()));
                },
                child: Icon(
                  Icons.add,
                  size: 30,
                )),
          )
        ],
      ),
      body: StoreProvider<AppState>(
        store: Redux.store,
              child: Container(
          child: Column(
            children: [
              StoreConnector<AppState, bool>(
                distinct: true,
                converter: (store) =>
                    store.state.addWasherState.isRegisterLoading,
                builder: (context, isRegisterLoading) {
                  if (isRegisterLoading) {
                    return CircularProgressIndicator();
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              StoreConnector<AppState, Future<List<CarWasher>>>(
                  distinct: true,
                  converter: (store) => store.state.addWasherState.carWasher,
                  builder: (context, carwasher) {
                    return FutureBuilder(
                      future: carwasher,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            reverse: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                var item = snapshot.data[index].fisrtName;
                                var subItem = snapshot.data[index].phone;
                                return Card(
                                  elevation: 2,
                                  child: ListTile(
                                    title: Text(item),
                                    subtitle: Text(subItem),
                                    leading: Icon(Icons.person, size: 50),
                                  ),
                                );
                              });
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: unused_element
void _showDialog(
  context,
  int id,
) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Detail"),
        content: Container(
          height: MediaQuery.of(context).size.height / 38,
          width: MediaQuery.of(context).size.width - 50,
          child: Text('Delete element'),
        ),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          new FlatButton(
            child: new Text("Delete"),
            onPressed: () async {
              final database = await $FloorAppDatabase
                  .databaseBuilder('app_database.db')
                  .build();
              try {
                database.carwasherDao.deleteCarWasher(id);
              } catch (e) {
                print(e);
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
