import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:blocktrade/store.dart';

import 'order_class.dart';

final f1 = NumberFormat("#,##0.", "en_US");
final f2 = NumberFormat("#,##0.00", "en_US");

class Tab4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Store store1 = Provider.of<Store>(context);
    //get_orderhistory(context);
    // todo
    // conditional rendering
    // use short hand if
    // if bool in Store == false ,show circular
    // when I post the data and receive the data from server
    // in that function reset the bool value to be true
    // then in the ui , if true == show builder

    return Scaffold(
      body: SingleChildScrollView(
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
                    // "Order History",
                    store1.h5.tr(),
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            RequestHistory(),
            //For Order History Model
            // StockHistoryList(),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////// Order History Design

class RequestHistory extends StatefulWidget {
  @override
  _RequestHistoryState createState() => _RequestHistoryState();
}

class _RequestHistoryState extends State<RequestHistory> {
  @override
  Widget build(BuildContext context) {
    Store s1 = Provider.of<Store>(context);

    Future<List<OrderHistory>> list_order() async {
      const _url = 'http://192.168.1.41:8000/api/orderhistory/';

      var param = {'username': s1.customerUsername};

      var jsontxt = json.encode(param);
      var response = await http.post(
        Uri.parse(_url),
        body: jsontxt,
        headers: {'Content-Type': "application/json"},
      );
      var result_map = await json.decode(response.body) as List;
      return result_map.map((e) => OrderHistory.fromMap(e)).toList();
    } //end of list_order function

    return FutureBuilder<List<OrderHistory>>(
      future: list_order(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } //end of if
        else {
          return RequestLayout(
            input_snapshot: snapshot,
          );
        }
      },
    );
  }
}

class RequestLayout extends StatefulWidget {
  AsyncSnapshot input_snapshot;
  RequestLayout({required this.input_snapshot});
  @override
  _RequestLayoutState createState() => _RequestLayoutState();
}

class _RequestLayoutState extends State<RequestLayout> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 500,
        child: ListView.builder(
          itemCount: widget.input_snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(top: 15),
                width: 390,
                height: 150,
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
                        //Symbol
                        Text(
                          widget.input_snapshot.data[index].symbol.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        //Status
                        Text(
                          widget.input_snapshot.data[index].status.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ],
                    ),
                    //Date
                    Text(widget.input_snapshot.data[index].date.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //Volume
                            Text("Volume:"),
                            Text(
                              f1
                                  .format(
                                      widget.input_snapshot.data[index].volume)
                                  .toString(),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //Price
                            Text("Price:"),
                            Text(pricing(
                                widget.input_snapshot.data[index].price)),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //Derivative Amount
                            Text("Derivative Amount:"),
                            Text(
                              f1
                                  .format(widget.input_snapshot.data[index]
                                      .derivativeAmount)
                                  .toString(),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  } //end of function build
} //end of class

String pricing(String input1) {
  if (input1 == '') {
    return "waiting";
  } //end of if
  else {
    return f2.format(double.parse(input1)).toString();
  } //end of else
} //end of function pricing

class StockHistoryList extends StatefulWidget {
  const StockHistoryList({
    Key? key,
  }) : super(key: key);

  @override
  _StockHistoryListState createState() => _StockHistoryListState();
}

class _StockHistoryListState extends State<StockHistoryList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          OrderListDetail(
            StockName: "Stock Name 1",
            Status: "in processing",
            Volume: '3,000',
            Price: '60',
            Total: '180,000',
            Date: "@ 3:34 p.m. 20/8/2021 ",
          ),
          OrderListDetail(
            StockName: "Stock Name 2",
            Status: "completed",
            Volume: '2,000',
            Price: '20',
            Total: '40,000',
            Date: "@ 11:00 a.m. 20/8/2021 ",
          ),
          OrderListDetail(
            StockName: "Stock Name 3",
            Status: "completed",
            Volume: '3,000',
            Price: '30',
            Total: '90,000',
            Date: "@ 10:30 a.m. 20/8/2021 ",
          ),
        ],
      ),
    );
  }
}

class OrderListDetail extends StatelessWidget {
  String StockName;
  String Status;
  String Volume;
  String Price;
  String Total;
  String Date;
  OrderListDetail({
    Key? key,
    required this.StockName,
    required this.Status,
    required this.Volume,
    required this.Price,
    required this.Total,
    required this.Date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 15),
      width: 390,
      height: 150,
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
                StockName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                Status,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
          Text(Date),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Volume:"),
                  Text(Volume),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Price:"),
                  Text(Price),
                ],
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Total:"),
                  Text(Total),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
} //ec
