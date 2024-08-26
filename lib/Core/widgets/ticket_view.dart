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
      height: 189,
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
                      const BigDot(),
                      Expanded(
                          child: Stack(
                        children: [
                          const SizedBox(
                            height: 24,
                            child: AppLayoutBuilderWidget(
                              randomDivider: 6,
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                                angle: 1.57,
                                child: const Icon(
                                  Icons.local_airport_rounded,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      )),
                      const BigDot(),
                      Expanded(child: Container()),
                      TextStyleThird(text: ticket["to"]["code"])
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(text: ticket["from"]["name"]),
                      ),
                      Expanded(child: Container()),
                      Text(
                        ticket["flying_time"],
                        style: AppStyles.headLineStyle4
                            .copyWith(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      SizedBox(
                          width: 100,
                          child: TextStyleFourth(
                              text: ticket["to"]["name"], align: TextAlign.end))
                    ],
                  )
                ],
              ),
            ),
            // Separator
            Container(
              color: AppStyles.ticketOrange,
              child: const Row(
                children: [
                  BigCircle(
                    isRight: false,
                  ),
                  Expanded(
                      child: AppLayoutBuilderWidget(
                    randomDivider: 16,
                    separator: 6,
                  )),
                  BigCircle(
                    isRight: true,
                  )
                ],
              ),
            ),
            // Orange part of the ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppStyles.ticketOrange,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnTextLayout(topText: ticket["date"], bottomText: "Date", alignment: CrossAxisAlignment.start,),
                      AppColumnTextLayout(topText: ticket["departure_time"], bottomText: "Department time", alignment: CrossAxisAlignment.center),
                      AppColumnTextLayout(topText: ticket["number"].toString(), bottomText: "Number", alignment: CrossAxisAlignment.end)
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
