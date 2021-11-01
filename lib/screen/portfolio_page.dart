import 'package:blocktrade/store.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../drawer_page.dart';

class Tab1 extends StatelessWidget {
  static String routeName = "/portfolio_screen";
  @override
  Widget build(BuildContext context) {
    var store1 = Provider.of<Store>(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    store1.h11.tr(),
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    //white box
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 800,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.topCenter,
                            child: CreditinPortfolio(),
                          ),
                          SizedBox(height: 10),
                          OverView(),
                          SizedBox(height: 10),
                          MyPortfolio(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  } //ef
} //ec

class OverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store1 = Provider.of<Store>(context);
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            store1.h13.tr(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: Row(
                children: [
                  SizedBox(width: 5),
                  SETItem(
                    name: "SET",
                    last: "1,650.33",
                    icon: Icon(
                      Icons.bar_chart,
                      color: Colors.green,
                    ),
                    change: "+2.58",
                    perchange: "+0.16%",
                    color: Colors.green,
                  ),
                  SETItem(
                    name: "SET50",
                    last: "1,000.64",
                    icon: Icon(
                      Icons.bar_chart,
                      color: Colors.orange,
                    ),
                    change: "+1.83",
                    perchange: "+0.18%",
                    color: Colors.green,
                  ),
                  SETItem(
                    name: "SET100",
                    last: "2,271.81",
                    icon: Icon(
                      Icons.bar_chart,
                      color: Colors.yellow.shade700,
                    ),
                    change: "+3.58",
                    perchange: "+0.16%",
                    color: Colors.green,
                  ),
                  SETItem(
                    name: "sSET",
                    last: "1026.63",
                    icon: Icon(
                      Icons.bar_chart,
                      color: Colors.blue,
                      size: 35,
                    ),
                    change: "-2.27",
                    perchange: "-0.22%",
                    color: Colors.red,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black, width: 0.2),
                    ),
                    child: Center(
                      child: Text(
                        "+",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SETItem extends StatelessWidget {
  final String name;
  final String last;
  final String change;
  final String perchange;
  final Color color;
  final Icon icon;

  const SETItem(
      {Key? key,
      required this.name,
      required this.icon,
      required this.last,
      required this.change,
      required this.perchange,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 85,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: Colors.black54.withOpacity(0.2),
                offset: Offset(0, 0),
                blurRadius: 5)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          icon,
          Text(
            "|",
            style: TextStyle(fontSize: 60, color: Colors.grey),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(width: 15),
                  Text(
                    perchange,
                    style: TextStyle(color: color, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                last,
                style: TextStyle(color: Colors.black54),
              ),
              Text(
                change,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ],
      ),
    );
  } //ef
} //ec

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var store1 = Provider.of<Store>(context);
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 5),
      width: 390,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: Colors.black54.withOpacity(0.2),
                offset: Offset(0, 0),
                blurRadius: 15)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                store1.h12.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey)
            ],
          ),
        ],
      ),
    );
  }
}

class CreditinPortfolio extends StatelessWidget {
  const CreditinPortfolio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //profile
        ProfileRnd(
          heightcam: 30,
          widthcam: 30,
          widthprofile: 120,
          heightprofile: 120,
          positioncamRight: 5,
        ),

        Container(
          width: 250,
          padding: EdgeInsets.all(5),
          decoration: CreditBoxDecoration(),
          child: CreditBox(sizeofCreditNumber: 40),
        ),
      ],
    );
  }
} //ec
