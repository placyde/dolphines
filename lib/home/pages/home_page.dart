import 'package:dolphins/home/home.dart';
import 'package:dolphins/sidebar/sidebar_layout.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      endDrawer: SidebarLayout(),
      appBar: MyCustomAppBar(
        height: 95,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            new Container(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width - 10,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                border: Border.all(
                  width: 0.40,
                  color: Color(0xff707070),
                ),
                borderRadius: BorderRadius.circular(19.00),
              ),
              child: mychart1Items('Activités'),
            ),
            // Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashItems(
                    title: 'Recette',
                    count: 50050000,
                    icon: Icons.monetization_on,
                  ),
                  DashItems(
                    title: 'Car Wash',
                    count: 200,
                    icon: Icons.local_car_wash,
                  ),
                ],
              ),
            ),
            new Container(
              height: 160.00,
              width: MediaQuery.of(context).size.width - 10,
              decoration: BoxDecoration(
                color: Color(0xff54c5f8).withOpacity(0.25),
                borderRadius: BorderRadius.circular(19.00),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    WasherProfilItems(name: 'Claude',),
                    WasherProfilItems(name: 'Jean',),
                    WasherProfilItems(name: 'Alain',),
                    WasherProfilItems(name: 'Thomas',)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WasherProfilItems extends StatelessWidget {
  final String name;
  const WasherProfilItems({
    Key key,this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Container(
            height: 100.00,
            width: 100.00,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(height: 5,),
          Text('$name')
        ],
      ),
    );
  }
}

class DashItems extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;
  const DashItems({Key key, this.title, this.count, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width / 2.1,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        border: Border.all(
          width: 0.40,
          color: Color(0xff707070),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00, 3.00),
            color: Color(0xff000000).withOpacity(0.16),
            blurRadius: 6,
          ),
        ],
        borderRadius: BorderRadius.circular(19.00),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$title', style: TextStyle(fontSize: 15)),
            Icon(
              icon,
              size: 100,
              color: Color(0xff54c5f8),
            ),
            Text(
              '$count',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
