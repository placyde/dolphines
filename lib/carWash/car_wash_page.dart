
import 'package:dolphins/carWash/add_car_wash_page.dart';
import 'package:dolphins/carWash/car_wash_action.dart';
import 'package:dolphins/entity/entity.dart';
import 'package:dolphins/redux/global_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';

class CarWashPage extends StatefulWidget {
  @override
  _CarWashPageState createState() => _CarWashPageState();
}

class _CarWashPageState extends State<CarWashPage> {
  showData(){
    Redux.store.dispatch(fetchCarWashAction);
  }
  @override
  Widget build(BuildContext context) {
    showData();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCarWash()));
        }),
      appBar: AppBar(
        title: Text('Car Wash'),
      ),
      body: StoreProvider<AppState>(
        store: Redux.store,
        child:  StoreConnector<AppState, Future<List<CarWash>>>(
          distinct: true,
              converter: (store) =>store.state.carWashState.carWash,
              builder: (context, store) =>FutureBuilder(
                future: store,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                       itemCount: snapshot.data.length,
                       reverse: true,
                       shrinkWrap: true,
                      itemBuilder:  (context, index){
                        DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
                        DateTime dateTime = dateFormat.parse(snapshot.data[index].createTime);
                        return Card(
                          elevation: 2,
                          child: ListTile(
                            title: Text('${snapshot.data[index].matricule}'),
                            trailing: Text('${snapshot.data[index].washPrice}'),
                            subtitle: Text('${dateTime.day}/${dateTime.month}/${dateTime.year} à ${dateTime.hour}:${dateTime.minute}'),
                            
                          ),
                        );
                      });
                  }
                   if (snapshot.data == null) {
                    return Center(child: Text('No data'));
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
               )
        ),
      ),
    );
  }
}
