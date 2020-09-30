import 'package:flutter/material.dart';
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Container(
        height: 60.00,
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.00, 3.00),
              color: Color(0xff878686).withOpacity(0.22),
              blurRadius: 6,
            ),
          ],
          borderRadius: BorderRadius.circular(11.00),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: InkWell(
                  onTap: () {
                     _scaffoldKey.currentState.openEndDrawer();
                  },
                  child: Icon(
                    Icons.menu,
                    size: 40,
                    color: Color(0xff666666),
                  )),
            ),
            new Text(
              "Dolphins",
              style: TextStyle(
                fontFamily: "Nirmala UI",
                fontWeight: FontWeight.w700,
                fontSize: 25,
                color: Color(0xff54c5f8),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.person,
                size: 40,
                color: Color(0xff666666),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}