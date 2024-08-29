import 'package:flutter/material.dart';
import 'package:kct/screens/all_tickets.dart';
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
        "/":(context) => const BottomNavBar(),
        "/all_tickets":(context) => const AllTickets(),
        "/ticket_view":(context) => const TicketScreen()
      },
    );
  }
}

