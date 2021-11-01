import 'package:badges/badges.dart';
import 'package:blocktrade/search_page.dart';
import 'package:flutter/material.dart';

AppBar bar0 = new AppBar(
  title: Container(
    margin: EdgeInsets.only(left: 101),
    // padding: EdgeInsets.symmetric(horizontal: 105),
    child: Text(
      "Globlex",
      style: TextStyle(color: Colors.grey),
    ),
  ),
  backgroundColor: Colors.white,
  iconTheme: IconThemeData(color: Colors.grey),
  elevation: 0,
  actions: [
    //badge icon tob show how many product in the order
    Badge(
      position: BadgePosition.topStart(start: -1, top: 0),
      borderRadius: BorderRadius.circular(8),
      badgeContent: Text("2", style: TextStyle(color: Colors.white)),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.notifications,
          size: 30,
        ),
      ),
    )
  ],
);

AppBar bar1 = new AppBar(
  title: Container(
    margin: EdgeInsets.only(left: 101),
    child: Text(
      "Globlex",
      style: TextStyle(color: Colors.grey),
    ),
  ),
  backgroundColor: Colors.white,
  iconTheme: IconThemeData(color: Colors.grey),
  elevation: 0,
  actions: [
    //badge icon tob show how many product in the order
    SearchAppBar()
  ],
);

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: SearchData());
          },
          icon: Icon(
            Icons.search,
            color: Colors.grey,
            size: 30,
          ),
        ),
        Badge(
          position: BadgePosition.topStart(start: -1, top: 0),
          borderRadius: BorderRadius.circular(8),
          badgeContent: Text("2", style: TextStyle(color: Colors.white)),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}

AppBar bar2 = new AppBar(
  backgroundColor: Colors.white,
  iconTheme: IconThemeData(color: Colors.grey),
  elevation: 0,
);
