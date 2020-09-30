
import 'package:after_layout/after_layout.dart';
import 'package:dolphins/carWash/car_wash_page.dart';
import 'package:dolphins/setting/setting_page.dart';
import 'package:dolphins/sidebar/sidebar_item.dart';
import 'package:dolphins/washer/washer_page.dart';
import 'package:flutter/material.dart';

class SidebarLayout extends StatefulWidget {
  @override
  _SidebarLayoutState createState() => _SidebarLayoutState();
}

class _SidebarLayoutState extends State<SidebarLayout> with AfterLayoutMixin{
  int selectedIndex;
  LabeledGlobalKey _walletKey = LabeledGlobalKey("War Wash");
  LabeledGlobalKey _restaurantKey = LabeledGlobalKey("Washers");
  LabeledGlobalKey _myCartKey = LabeledGlobalKey("setting");
  LabeledGlobalKey _myProfileKey = LabeledGlobalKey("myProfileKey");

  RenderBox renderBox;
  double startYPosition;

  void onTabTap(int index) {
    setState(() {
      selectedIndex = index;
      switch (selectedIndex) {
        case 0:
          renderBox = _walletKey.currentContext.findRenderObject();
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CarWashPage()));
          break;
        case 1:
          renderBox = _restaurantKey.currentContext.findRenderObject();
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context)=> WashersPage()));
          break;
        case 2:
          renderBox = _myCartKey.currentContext.findRenderObject();
          Navigator.pop(context);
          break;
        case 3:
          renderBox = _myProfileKey.currentContext.findRenderObject();

          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage()));
          break;
      }

      startYPosition = renderBox.localToGlobal(Offset.zero).dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          width: 90,
          top: 0,
          bottom: 0,
          right: 0,
          child: ClipPath(
            clipper: SidebarClipper(
              (startYPosition == null) ?  0 : startYPosition - 40,
              (startYPosition == null) ? 0 :  startYPosition + 80,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
            ),
          ),
        ),
        Positioned(
          right: -25,
          top: 0,
          bottom: 0,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Icon(
                Icons.dashboard,
                color: Color(0xff54c5f8),
              ),
              SizedBox(
                height: 40,
              ),
              Icon(
                Icons.search,
                color: Color(0xff54c5f8),
              ),
              SizedBox(
                height: 120,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SidebarItem(
                      key: _walletKey,
                      text: "Car Washe",
                      onTabTap: () {
                        onTabTap(0);
                        
                      },
                      isSelected: selectedIndex == 0,
                    ),
                    SidebarItem(
                      key: _restaurantKey,
                      text: "Washer",
                      onTabTap: () {
                        onTabTap(1);
                      },
                      isSelected: selectedIndex == 1,
                    ),
                    SidebarItem(
                      key: _myCartKey,
                      text: "profile",
                      onTabTap: () {
                        onTabTap(2);
                      },
                      isSelected: selectedIndex == 2,
                    ),
                    SidebarItem(
                      key: _myProfileKey,
                      text: "Setting",
                      onTabTap: () {
                        onTabTap(3);
                      },
                      isSelected: selectedIndex == 3,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      renderBox = _walletKey.currentContext.findRenderObject();
      startYPosition = renderBox.localToGlobal(Offset.zero).dy;
    });
  }
}



class SidebarClipper extends CustomClipper<Path> {
  final double startYPosition, endYPosition;

  SidebarClipper(this.startYPosition, this.endYPosition);

  @override
  Path getClip(Size size) {
    Path path = Path();

    double width = size.width;
    double height = size.height;

    //up curve
    path.moveTo(width, 0);
    path.quadraticBezierTo(width / 3, 5, width / 3, 70);

    //custom curve
    path.lineTo(width / 3, startYPosition);
    path.quadraticBezierTo(width / 3 - 2, startYPosition + 15, width / 3 - 10, startYPosition + 25);
    path.quadraticBezierTo(0, startYPosition + 45, 0, startYPosition + 60);
    path.quadraticBezierTo(0, endYPosition - 45, width / 3 - 10, endYPosition - 25);
    path.quadraticBezierTo(width / 3 - 2, endYPosition - 15, width / 3, endYPosition);

    //down curve
    path.lineTo(width / 3, height - 70);
    path.quadraticBezierTo(width / 3, height - 5, width, height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
