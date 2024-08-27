import 'package:flutter/material.dart';

class AppLayoutBuilderWidget extends StatelessWidget {

  final int randomDivider;
  final double separator;
  final bool? isColor;

  const AppLayoutBuilderWidget({super.key, required this.randomDivider, this.separator = 3, this.isColor});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
      return Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: List.generate((constraints.constrainWidth()/randomDivider).floor(), (index) => SizedBox(
          width: separator,
          height: 1,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isColor==null? Colors.white : Colors.grey.shade300
        )),
        )),
      );
    });
  }
}