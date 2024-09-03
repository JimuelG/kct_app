import 'package:flutter/material.dart';

class HotelDetail extends StatelessWidget {
  const HotelDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Hotel Title"),
              background: Image.network(
                "https://via.placeholder.com/600x400"
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              const Padding(padding: EdgeInsets.all(16.0),
              child: Text("asdddddddddddddddljkkkkkkkkaslkcbnasc lkajsdddddddddm,n n ,mnnnnnnnnnnnnnnnwqdlkaj asdm,nasca,smdnasm,dna,m na,msndasdkljh askldhasdhaslkj haskldhajsldkajsdlkjasdklajsdaskldjalskjdaklsdj alkjdaklsjd aklsjd klasjdklasjd klasdj")),
              const Padding(padding: EdgeInsets.all(16.0),
              child: Text("More Images", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),
              Container(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index){
                  return Container(
                    margin: const EdgeInsets.all(8),
                    color: Colors.red,
                    child: Image.network(
                      "https://via.placeholder.com/200x200"
                    ),
                  );
                })
              )
              
            ]
          ))
        ],
      ),
    );
  }
}