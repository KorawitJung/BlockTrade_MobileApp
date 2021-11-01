import 'package:blocktrade/screen/GraphPage/candle.dart';
import 'package:blocktrade/screen/GraphPage/model/candledata.dart';
import 'package:flutter/material.dart';
import 'package:interactive_chart/interactive_chart.dart';

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CandleData> _data = MockData.candles;
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
                    "SCB",
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
                        height: 600,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    //white box 1 (filter)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                      child: Row(
                        children: [
                          FilterButton(
                            textinfilter: 'Days',
                          ),
                          FilterButton(
                            textinfilter: 'Weeks',
                          ),
                          FilterButton(
                            textinfilter: 'Months',
                          ),
                          FilterButton(
                            textinfilter: 'Qtrs',
                          ),
                          FilterButton(
                            textinfilter: 'Years',
                          ),
                        ],
                      ),
                    ),

                    // white box 2 (Graph)
                    Container(
                      margin: EdgeInsets.only(left: 30, right: 30, top: 60),
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 25, right: 25, top: 30, bottom: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        child: InteractiveChart(
                          candles: _data,
                          overlayInfo: (candle) => {
                            "Hi": "${candle.high?.toStringAsFixed(2)}",
                            "Lo": "${candle.low?.toStringAsFixed(2)}",
                          },
                        ),
                      ),
                    ),
                    //white box 3 (Details)
                    Container(
                      margin: EdgeInsets.only(
                        top: 380,
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 700,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Align(
                            alignment: Alignment.center,
                            child: GraphTablePageShort()),
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
  }
} //ec

class FilterButton extends StatelessWidget {
  final String textinfilter;
  const FilterButton({
    Key? key,
    required this.textinfilter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2, right: 2),
      width: 66,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextButton(
        onPressed: () {},
        child: Align(
            alignment: Alignment.center,
            child: Text(
              textinfilter,
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
} //ec

