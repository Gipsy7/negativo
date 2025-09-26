import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String label;
  final double value;
  final double percentage;

  ChartBar({this.label = '', this.value = 0, this.percentage = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text('R\$ ${value.toStringAsFixed(2)}', style: TextStyle(color: Colors.white, fontSize: 12),),
        ),
        SizedBox(height: 5,),
        Container(
          height: 60,
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
        SizedBox(height: 5,),
        Text(label, style: TextStyle(color: Colors.white, fontSize: 10),),
      ],
    );
  }
}