import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../widgets/calculation_card.dart';
import '../../widgets//title_card.dart';
import '../../widgets/line_char.dart';
import '../../widgets/bill_table.dart';

class PageMiddle extends StatelessWidget {
  const PageMiddle({super.key});

  final List<CalculationData> _calculationData = const [
    CalculationData(
      title: 'Total money',
      value: '19.231',
      yoy: 10,
    ),
    CalculationData(
      title: 'This month\'s income',
      value: '2.300',
      yoy: 12.0,
    ),
    CalculationData(
      title: 'Expenses this month',
      value: '1.230',
      yoy: -2.0,
    ),
  ];

  final List<BillTableData> _data = const [
    BillTableData(
      transaction: 'Spotify',
      id: '#A32132',
      amount: '-\$15.99',
      date: 'Web 1:00pm',
      account: 'Visa 1224',
    ),
    BillTableData(
      transaction: 'Takeout',
      id: '#C32142',
      amount: '-\$28.24',
      date: 'Web 2:00pm',
      account: 'Visa 1254',
    ),
    BillTableData(
      transaction: 'Yonghui Supermarket',
      id: '#A42362',
      amount: '-\$220.5',
      date: 'Web 3:00pm',
      account: 'Visa 1634',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          padding: EdgeInsets.only(
            left: constraints.maxWidth * 0.02,
            right: constraints.maxWidth * 0.02,
            top: constraints.maxHeight * 0.017,
            bottom: constraints.maxHeight * 0.017,
          ),
          color: Theme.of(context).colorScheme.background,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                flex: 180,
                child: GridView.extent(
                  maxCrossAxisExtent:
                      constraints.maxWidth / _calculationData.length,
                  crossAxisSpacing: constraints.maxWidth * 0.03,
                  padding: EdgeInsets.only(
                    left: constraints.maxWidth * 0.02,
                    right: constraints.maxWidth * 0.02,
                    top: constraints.maxHeight * 0.017,
                    bottom: constraints.maxHeight * 0.017,
                  ),
                  childAspectRatio: (constraints.maxWidth *
                          (1 - ((0.03 + 0.02) * _calculationData.length - 1))) /
                      (constraints.maxHeight * (1 - (0.017 * 2))),
                  children: List.generate(_calculationData.length, (index) {
                    return CalculationCard(
                      data: _calculationData[index],
                    );
                  }),
                ),
              ),
              Expanded(
                flex: 442,
                child: TitleCard(
                  margin: EdgeInsets.only(
                    left: constraints.maxWidth * 0.02,
                    right: constraints.maxWidth * 0.02,
                    top: constraints.maxHeight * 0.017,
                    bottom: constraints.maxHeight * 0.017,
                  ),
                  title: 'Sales report',
                  action: 'View report',
                  color: Theme.of(context).colorScheme.primary,
                  child: const LineChartSample(
                    keys: [
                      'Jon',
                      'Feb',
                      'Mor',
                      'Apr',
                      'May',
                      'Jun',
                      'Jul',
                      'Aug',
                      'Sep',
                      'Oct',
                      'Nov',
                      'Dec'
                    ],
                    values: [5, 6, 7, 8, 2, 4, 3, 7, 9, 7, 6, 1],
                    maxValue: 10,
                  ),
                ),
              ),
              Expanded(
                flex: 412,
                child: TitleCard(
                  title: 'Transaction Hvistory',
                  action: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 4, right: 4),
                        child: Icon(
                          Icons.date_range_rounded,
                          color: Theme.of(context).textTheme.subtitle2!.color,
                        ),
                      ),
                      AutoSizeText(
                        'Select dates',
                        maxLines: 1,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ],
                  ),
                  color: Theme.of(context).colorScheme.primary,
                  margin: EdgeInsets.only(
                    left: constraints.maxWidth * 0.02,
                    right: constraints.maxWidth * 0.02,
                    top: constraints.maxHeight * 0.017,
                    bottom: constraints.maxHeight * 0.017,
                  ),
                  child: BillTable(data: _data),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
