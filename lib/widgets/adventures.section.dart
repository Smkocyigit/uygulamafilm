import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:uygulama_film/screens/adventure.screen.dart';


class AdventureSection extends StatelessWidget {

  List images = [
    'Jungle Cruıse7',
    'Love And Monsters8',
    'Troll Avı9',
    'Aladdin10',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 500,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(microseconds: 800),
            viewportFraction: 0.65,
          ),
          items: [
            for(int i = 0; i < images.length; i++)
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) =>
                      AdventureScreen
                        (images[i])));
                },
                child: Container(
                  margin: EdgeInsets.all(6),
                  child: Column(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "images/${images[i]}.jpg",
                        height: 300,
                        width: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("PG-13",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),),

                          Text("Adventure",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 5),
                            Text(
                              "8.3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],)

                        ],
                      ),
                    ),

                    SizedBox(height: 5),
                    Text(
                      images[i],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],),
                ),
              )
          ],
        )
      ],
    );
  }
}