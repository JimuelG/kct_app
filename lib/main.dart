import 'package:flutter/material.dart';
import 'package:kct/Core/utils/app_routes.dart';
import 'package:kct/screens/all_tickets.dart';
import 'package:kct/screens/home/all_hotels.dart';
import 'package:kct/screens/hotel_detail.dart';
import 'package:kct/screens/ticket/ticket_screen.dart';

import 'Core/BottomNavBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.homePage:(context) => const BottomNavBar(),
        AppRoutes.allTickets:(context) => const AllTickets(),
        AppRoutes.ticktScreen:(context) => const TicketScreen(),
        AppRoutes.allHotels:(context) => const AllHotels(),
        AppRoutes.hotelDetail:(context) => const HotelDetail()
      },
    );
  }
}

