import 'package:flutter/material.dart';
import 'package:flutter_ecom/views/shared/spacer/custom_spacer_wiget.dart';
import 'package:ionicons/ionicons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/sneaker_model.dart';
import '../../services/helper.dart';
import '../shared/appstyle.dart';
import '../shared/button/category_btn.dart';
import '../shared/home/latest_shoes_wiget.dart';

class ProductByCart extends StatefulWidget {
  const ProductByCart({super.key, required this.tabIndex});
  final int tabIndex;

  @override
  State<ProductByCart> createState() => _ProductByCartState();
}

class _ProductByCartState extends State<ProductByCart>
    with TickerProviderStateMixin {
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
    _tabController.animateTo(widget.tabIndex, curve: Curves.easeIn);
    getMale();
    getFemale();
    getKid();
  }

  List<String> brands = [
    "assets/images/adidas.png",
    "assets/images/gucci.png",
    "assets/images/jordan.png",
    "assets/images/nike.png"
  ];

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Ionicons.close,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: const Icon(
                            FontAwesomeIcons.sliders,
                            color: Colors.white,
                          ),
                        )
                      ]),
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
                    Tab(
                      text: "Men Shoes",
                    ),
                    Tab(
                      text: "Women Shoes",
                    ),
                    Tab(
                      text: "Kids Shoes",
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.175,
                left: 16,
                right: 12),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: TabBarView(controller: _tabController, children: [
                LatestShoesWiget(male: _male),
                LatestShoesWiget(male: _female),
                LatestShoesWiget(male: _kid)
              ]),
            ),
          )
        ]),
      ),
    );
  }

  Future<dynamic> filter() {
    double value = 100;
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white54,
        builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.84,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 5,
                  width: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black38,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(children: [
                    const CustomSpacer(),
                    Text(
                      "Filter",
                      style: appStype(40, Colors.black, FontWeight.bold),
                    ),
                    const CustomSpacer(),
                    Text(
                      "Gender",
                      style: appStype(20, Colors.black, FontWeight.bold),
                    ),
                    const CustomSpacer(),
                    const Row(
                      children: [
                        CategoryBtn(label: "Men", btnColor: Colors.black),
                        CategoryBtn(label: "Women", btnColor: Colors.grey),
                        CategoryBtn(label: "Kid", btnColor: Colors.grey),
                      ],
                    ),
                    const CustomSpacer(),
                    Text(
                      "Category",
                      style: appStype(20, Colors.black, FontWeight.w600),
                    ),
                    const CustomSpacer(),
                    const Row(
                      children: [
                        CategoryBtn(label: "Shoes", btnColor: Colors.black),
                        CategoryBtn(label: "Apparreis", btnColor: Colors.grey),
                        CategoryBtn(
                            label: "Accessories", btnColor: Colors.grey),
                      ],
                    ),
                    const CustomSpacer(),
                    Text(
                      "Prices",
                      style: appStype(20, Colors.black, FontWeight.w600),
                    ),
                    const CustomSpacer(),
                    Slider(
                        value: value,
                        activeColor: Colors.black,
                        inactiveColor: Colors.grey,
                        thumbColor: Colors.black,
                        max: 500,
                        divisions: 50,
                        label: value.toString(),
                        secondaryTrackValue: 200,
                        onChanged: (double val) {}),
                    const CustomSpacer(),
                    Text(
                      "Branchs",
                      style: appStype(20, Colors.black, FontWeight.w600),
                    ),
                    const CustomSpacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 80,
                      child: ListView.builder(
                        itemCount: brands.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              child: Image.asset(
                                brands[index],
                                height: 60,
                                width: 80,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ]),
                ),
              ]),
            ));
  }
}
