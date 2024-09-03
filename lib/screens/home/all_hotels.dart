import 'package:flutter/material.dart';
import 'package:kct/Core/res/styles/app_styles.dart';
import 'package:kct/Core/utils/all_json.dart';
import 'package:kct/Core/utils/app_routes.dart';
import 'package:kct/screens/home/widgets/hotel.dart';


class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: const Text("All Hotels"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.9),
            itemCount: hotelList.length,
            itemBuilder: (context, index)
            {
              var singleHotel =hotelList[index];
              return HotelGridview(hotel: singleHotel);
            }),
        ),
      ),
    );
  }
}


class HotelGridview extends StatelessWidget {
  final Map<String, dynamic> hotel;
  const HotelGridview({super.key, required  this.hotel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.hotelDetail);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        // width: size.width*0.6,
        height: 350,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: AppStyles.primaryColor,
          borderRadius: BorderRadius.circular(18)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                decoration: BoxDecoration(
                  color: AppStyles.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/${hotel['image']}"
                  )
                  )
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                hotel['place'],
                style: AppStyles.headLineStyle3.copyWith(color: Colors.white),
              ),
            ),
            Row(
              children: [
                Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                hotel['destination'],
                style: AppStyles.headLineStyle3.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(width: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "\$${hotel['price']}/night",
                style: AppStyles.headLineStyle4.copyWith(color: Colors.white),
              ),
            )
              ],
            )
          ],
        ),
      ),
    );
  }
}