import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:kct/Core/res/media.dart';
import 'package:kct/Core/res/styles/app_styles.dart';
import 'package:kct/Core/utils/all_json.dart';
import 'package:kct/Core/widgets/app_column_text_layout.dart';
import 'package:kct/Core/widgets/app_layoutbuilder_widget.dart';
import 'package:kct/Core/widgets/ticket_view.dart';
import 'package:kct/screens/search/widgets/app_ticket_tabs.dart';
import 'package:kct/screens/ticket/widget/ticket_positioned_circle.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {

  late int ticketIndex=0;


  @override
  void didChangeDependencies() {
    if(ModalRoute.of(context)!.settings.arguments != null)
    {
      var args = ModalRoute.of(context)!.settings.arguments as Map;
      ticketIndex = args["index"];
    }
    
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: const Text("Tickets"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              // const SizedBox(height: 40,),
              // Text("Tickets", style: AppStyles.headLineStyle1),
              // const SizedBox(height: 20),
              const AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous",),
              const SizedBox(height: 20,),
              // Black and White Ticket
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: TicketView(ticket: ticketList[ticketIndex], isColor: true)
              ),
              const SizedBox(height: 1,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                color: AppStyles.ticketColor,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                            topText: "Flutter DB", 
                            bottomText: "Passenger", 
                            alignment: CrossAxisAlignment.start, 
                            isColor: true,
                        ),
                         AppColumnTextLayout(
                            topText: "5221 36869", 
                            bottomText: "passport", 
                            alignment: CrossAxisAlignment.end, 
                            isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const AppLayoutBuilderWidget(randomDivider: 15 , separator: 5, isColor: false,),
                    const SizedBox(height: 20,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                            topText: "364738 28274478", 
                            bottomText: "B2SG28", 
                            alignment: CrossAxisAlignment.start, 
                            isColor: true,
                        ),
                         AppColumnTextLayout(
                            topText: "Number of E-ticket", 
                            bottomText: "Booking code", 
                            alignment: CrossAxisAlignment.end, 
                            isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const AppLayoutBuilderWidget(randomDivider: 15 , separator: 5, isColor: false,),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(AppMedia.visa, scale: 9),
                                Text(" *** 2462", style: AppStyles.headLineStyle3,)
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Text("Payment method", style: AppStyles.headLineStyle4,)
                          ],
                        ),
                         const AppColumnTextLayout(
                            topText: "\$249.99", 
                            bottomText: "Price", 
                            alignment: CrossAxisAlignment.end, 
                            isColor: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 1,),
              // bottom of the tcket detail section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: AppStyles.ticketColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(21),
                    bottomLeft: Radius.circular(21)
                  )
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BarcodeWidget(
                      height: 70,
                      barcode: Barcode.code128(), data: "https://www.facebook.com", 
                      drawText: false,
                      color: AppStyles.textColor,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              //Colorful ticket
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: TicketView(ticket: ticketList[ticketIndex])
              ),
            ],
          ),
          const TicketPositionedCircle(pos: true),
          const TicketPositionedCircle(pos: null),
        ],
      ),
    );
  }
}