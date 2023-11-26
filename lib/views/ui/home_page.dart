import 'package:flutter/material.dart';
import 'package:flutter_ecom/models/sneaker_model.dart';
import 'package:flutter_ecom/services/helper.dart';

import '../shared/appstyle.dart';
import '../shared/home_wiget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kid;

  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  void getFemale() {
    _female = Helper().getFemaleSneakers();
  }

  void getKid() {
    _kid = Helper().getKidSneakers();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getFemale();
    getKid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/top_image.png"),
                      fit: BoxFit.fill)),
              child: Container(
                padding: const EdgeInsets.only(left: 8, bottom: 15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Athletics Shoes',
                      style: appStypeWithHeight(
                          42, Colors.white, FontWeight.bold, 1.5),
                    ),
                    Text(
                      'Collections',
                      style: appStypeWithHeight(
                          42, Colors.white, FontWeight.bold, 1.5),
                    ),
                    TabBar(
                        padding: EdgeInsets.zero,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.transparent,
                        controller: _tabController,
                        isScrollable: true,
                        labelColor: Colors.white,
                        labelStyle: appStype(24, Colors.white, FontWeight.bold),
                        unselectedLabelColor: Colors.grey.withOpacity(0.3),
                        tabs: const [
                          Tab(text: "Men shoes"),
                          Tab(text: "Women shoes"),
                          Tab(text: "Kid shoes"),
                        ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.25),
              child: Container(
                padding: const EdgeInsets.only(left: 12),
                child: TabBarView(controller: _tabController, children: [
                  HomeWiget(
                    male: _male,
                    tabIndex: 0,
                  ),
                  HomeWiget(
                    male: _female,
                    tabIndex: 1,
                  ),
                  HomeWiget(
                    male: _kid,
                    tabIndex: 2,
                  )
                ]),
              ),
            )
          ]),
        ));
  }
}
