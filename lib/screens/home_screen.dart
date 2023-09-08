import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:uygulama_film/widgets/actions.section.dart';
import 'package:uygulama_film/widgets/adventures.section.dart';
import 'package:uygulama_film/widgets/comedy.section.dart';
import 'package:uygulama_film/widgets/fears.section.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Widget> _tabContents = [];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSection);

    // Sekme içeriklerini oluşturun
    _tabContents = <Widget>[
      FearsSection(), // All sekmesi
      ActionSection(), // Action sekmesi (Boş container kullanılıyor)
      AdventureSection(),// Adventure sekmesi (Boş container kullanılıyor)
      ComedySection(), // Comedy sekmesi (Boş container kullanılıyor)
    ];

    super.initState();
  }

  _handleTabSection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Align(
          alignment: Alignment.center, // Resmi merkeze hizala
          child: Column(
            children: [
              SizedBox(height: 50),
              Image.asset(
                'images/dpmovies.png',
                fit: BoxFit.cover,
                height: 400,
                filterQuality: FilterQuality.high,
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 250,
                enlargeCenterPage:true,
                aspectRatio: 16/9,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(microseconds: 800),
                viewportFraction: 0.8,
              ),
              items:[
                Container(
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage("images/upcoming1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ) ,
                ),

                Container(
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage("images/upcoming2.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ) ,
                ),
                Container(
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage("images/upcoming3.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ) ,
                ),

                Container(
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage("images/upcoming4.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ) ,
                ),
              ]
          ),
          SizedBox(height: 30),
          TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.white.withOpacity(0.5),
            isScrollable: true,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            labelPadding: EdgeInsets.symmetric(horizontal: 10),
            tabs: [
              Tab(text: "Fear"),
              Tab(text: "Action"),
              Tab(text: "Adventure"),
              Tab(text: "Comedy"),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: _tabContents[_tabController.index],
          )
        ],
      ),
    );
  }
}