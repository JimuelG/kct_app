import 'package:flutter/material.dart';
import 'package:kct/Core/res/styles/app_styles.dart';
import 'package:kct/Core/widgets/app_column_text_layout.dart';
import 'package:kct/Core/widgets/app_layoutBuilder_widget.dart';
import 'package:kct/Core/widgets/big_circle.dart';
import 'package:kct/Core/widgets/big_dot.dart';
import 'package:kct/Core/widgets/text_style_fourth.dart';
import 'package:kct/Core/widgets/text_style_third.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;
  const TicketView({super.key, required this.ticket, this.wholeScreen= false, this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: 179,
      child: Container(

        margin: EdgeInsets.only(right: wholeScreen==true?0:16),
        child: Column(
          children: [
            // Blue part of the ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: isColor==null? AppStyles.ticketBlue : AppStyles.ticketColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21),
                      topRight: Radius.circular(21))),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextStyleThird(text: ticket["from"]["code"], isColor: isColor),
                      Expanded(child: Container()),
                      BigDot(isColor: isColor,),
                      Expanded(
                          child: Stack(
                        children: [
                          SizedBox(
                            height: 24,
                            child: AppLayoutBuilderWidget(
                              randomDivider: 6,
                              separator: 6,
                              isColor: isColor,
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                                angle: 1.57,
                                child: Icon(
                                  Icons.local_airport_rounded,
                                  color: isColor==null? Colors.white : AppStyles.planeSecondColor,
                                )),
                          )
                        ],
                      )),
                      BigDot(isColor: isColor,),
                      Expanded(child: Container()),
                      TextStyleThird(text: ticket["to"]["code"], isColor: isColor,)
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(text: ticket["from"]["name"], isColor: isColor,),
                      ),
                      Expanded(child: Container()),
                      TextStyleFourth(
                        text: ticket["flying_time"],
                        isColor: isColor,
                      ),
                      Expanded(child: Container()),
                      SizedBox(
                          width: 100,
                          child: TextStyleFourth(
                              text: ticket["to"]["name"], align: TextAlign.end, isColor: isColor,))
                    ],
                  )
                ],
              ),
            ),
            // Separator
            Container(
              color: isColor==null ? AppStyles.ticketOrange : AppStyles.ticketColor,
              child: Row(
                children: [
                  BigCircle(
                    isRight: false,
                    isColor: isColor,
                  ),
                  const Expanded(
                      child: AppLayoutBuilderWidget(
                    randomDivider: 16,
                    separator: 6,
                  )),
                  BigCircle(
                    isRight: true,
                    isColor: isColor,
                  )
                ],
              ),
            ),
            // Orange part of the ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: isColor==null? AppStyles.ticketOrange : AppStyles.ticketColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(isColor==null?21 : 0),
                      bottomRight: Radius.circular(isColor==null?21 : 0))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnTextLayout(
                        topText: ticket["date"], 
                        bottomText: "Date", 
                        alignment: CrossAxisAlignment.start, 
                        isColor: isColor,),
                      AppColumnTextLayout(
                        topText: ticket["departure_time"], 
                        bottomText: "Department time", 
                        alignment: CrossAxisAlignment.center , 
                        isColor: isColor),
                      AppColumnTextLayout(
                        topText: ticket["number"].toString(), 
                        bottomText: "Number",
                        alignment: CrossAxisAlignment.end,
                        isColor: isColor),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
