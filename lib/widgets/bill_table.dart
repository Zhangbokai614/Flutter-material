import 'package:flutter/material.dart';

class BillTableData {
  const BillTableData({
    required this.transaction,
    required this.id,
    required this.amount,
    required this.date,
    required this.account,
  });

  final String transaction;
  final String id;
  final String amount;
  final String date;
  final String account;
}

class BillTable extends StatelessWidget {
  const BillTable({
    super.key,
    required this.data,
  });

  final List<BillTableData> data;

  @override
  Widget build(BuildContext context) {
    final rows = <DataRow>[];
    for (var item in data) {
      rows.add(
        DataRow(
          cells: [
            DataCell(
              Flex(
                direction: Axis.horizontal,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      item.transaction,
                      style: Theme.of(context).textTheme.subtitle2,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            DataCell(
              Text(
                item.id,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            DataCell(
              Text(
                item.amount,
                style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
              ),
            ),
            DataCell(
              Text(
                item.date,
                style: Theme.of(context).textTheme.subtitle1,
                maxLines: 1,
              ),
            ),
            DataCell(
              Text(
                item.account,
                style: Theme.of(context).textTheme.subtitle2,
                maxLines: 1,
              ),
            ),
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth * 0.94,
            minHeight: constraints.maxHeight,
          ),
          child: DataTable(
            dataRowHeight: constraints.maxHeight * 0.22,
            sortColumnIndex: 2,
            columns: const [
              DataColumn(label: Text('Transaction')),
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Amount')),
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('Account')),
            ],
            rows: rows,
          ),
        );
      },
    );
  }
}
