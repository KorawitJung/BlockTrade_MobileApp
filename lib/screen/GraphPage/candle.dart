import 'package:blocktrade/screen/GraphPage/model/candledata.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GraphTableWidget extends StatelessWidget {
  final Widget child;

  const GraphTableWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: child,
        ),
      );
} //ec

class GraphTablePageShort extends StatefulWidget {
  const GraphTablePageShort({Key? key}) : super(key: key);

  @override
  _GraphTablePageShortState createState() => _GraphTablePageShortState();
}

class _GraphTablePageShortState extends State<GraphTablePageShort> {
  // late List<Stock> stocks;
  late List<CandleData2> MockData2Row;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();

    this.MockData2Row = List.of(MockData2);
  }

  @override
  Widget build(BuildContext context) {
    return GraphTableWidget(child: buildDataTable());
  }

  Widget buildDataTable() {
    final columns = ['Open', 'High', 'Low', 'Close', 'Volume'];

    return DataTable(
      columnSpacing: 15,
      horizontalMargin: 12,
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(MockData2Row),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(
              column,
            ),
            // onSort: onSort,
          ))
      .toList();

  final f1 = NumberFormat("#,##0", "en_US");

  List<DataRow> getRows(List<CandleData2> MockData2Row) =>
      MockData2Row.map((CandleData2 MockData2Row) {
        final cells = [
          MockData2Row.open,
          MockData2Row.high,
          MockData2Row.low,
          MockData2Row.close,
          f1.format(MockData2Row.volume),
        ];

        return DataRow(
          cells: getCells(cells),
        );
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) => cells
      .map((data) => DataCell(Text(
            '$data',
            style: TextStyle(fontSize: 15),
          )))
      .toList();

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}//ec
