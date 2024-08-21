import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

import '../res/media.dart';
import '../res/styles/app_styles.dart';

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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Good morning",
                                style: AppStyles.headlineStyle3),
                            const SizedBox(
                              height: 5,
                            ),
                            Text("Welcome to KCT App",
                                style: AppStyles.headlineStyle1)
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
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
