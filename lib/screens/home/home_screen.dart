import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:kct/Core/utils/all_json.dart';
import 'package:kct/Core/widgets/app_double_text.dart';
import 'package:kct/Core/widgets/ticket_view.dart';
import 'package:kct/screens/home/widgets/hotel.dart';

import '../../Core/res/styles/app_styles.dart';
import '../../Core/res/media.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        children: [
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Welcome to",
                                style: AppStyles.headLineStyle3),
                            const SizedBox(
                              height: 5,
                            ),
                            Text("Aveiro Travel and Tours",
                                style: AppStyles.headLineStyle1)
                          ],
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: AssetImage(AppMedia.logo))),
                        )
                      ],
                    ),
                    const SizedBox(height: 25),
                    // Search bar
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF4F6FD),
                      ),
                      child: const Row(
                        children: [
                          Icon(FluentSystemIcons.ic_fluent_search_regular,
                              color: Color(0xFFBFC205)),
                          Text("Search")
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    AppDoubleText(bigText: 'Upcoming Flights', smallText: 'View all',
                    func: () => Navigator.pushNamed(context, "/all_tickets"),),
                    const SizedBox(height: 20),
                    // Ticket view
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: ticketList.take(3).map((singleTicket) => TicketView(ticket:singleTicket)
                            ).toList(),
                      )
                      ),
                    const SizedBox(height: 20),
                    AppDoubleText(
                      bigText: 'Hotels', 
                      smallText: 'View all',
                      func: (){
                      },
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: hotelList
                          .take(2)
                          .map((singleHotel) => 
                          Hotel(hotel: singleHotel)
                            ).toList(),
                      )
                      ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
