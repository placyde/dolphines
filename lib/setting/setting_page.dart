
import 'package:dolphins/setting/carType/car_type_page.dart';
import 'package:dolphins/setting/washType/washeTpye_page.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Card(
                elevation: 2,
                              child: ListTile(
                  title: Text('Car Type', style: TextStyle(fontSize: 20),),
                  leading: Icon(Icons.category),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CarTypeSetingPage()));
                  },
                ),
              ),
              Card(
                elevation: 2,
                              child: ListTile(
                  title: Text('Wash Type', style: TextStyle(fontSize: 20),),
                  leading: Icon(Icons.category),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddWashTypePage()));
                  },
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final Function function;
  final String title;
  const SettingItem({Key key, this.function, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: new Container(
          height: 60.00,
          width: MediaQuery.of(context).size.width - 10,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            border: Border.all(
              width: 0.20,
              color: Color(0xff878686),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0.00, 3.00),
                color: Color(0xff000000).withOpacity(0.03),
                blurRadius: 6,
              ),
            ],
            borderRadius: BorderRadius.circular(9.00),
          ),
          child: Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 10),
              child: Icon(
                Icons.traffic,
                size: 30,
                color: Color(0xff878686),
              ),
            ),
            new Text(
              title,
              style: TextStyle(
                fontFamily: "Nirmala UI",
                fontSize: 20,
                color: Color(0xff666666).withOpacity(0.70),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
