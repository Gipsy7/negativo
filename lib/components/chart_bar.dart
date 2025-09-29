import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String label;
  final double value;
  final double percentage;

  const ChartBar({this.label = '', this.value = 0, this.percentage = 0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) =>
      Column(
        children: [
          SizedBox(height: constraints.maxHeight * 0.05,),
          Container(
            height: constraints.maxHeight * 0.8,
            width: 10,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.0),
                    color: Color(0xFF162447),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 202, 238),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: constraints.maxHeight * 0.05,),
          Container(
            child: FittedBox(child: Text(label, style: TextStyle(color: Colors.white, fontSize: 10),)),
            height: constraints.maxHeight * 0.10,),
        ],
      ),
    );
  }
}