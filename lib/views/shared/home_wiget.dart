import 'package:flutter/material.dart';
import 'package:flutter_ecom/views/ui/product_by_cart.dart';
import 'package:flutter_ecom/views/ui/product_page.dart';
import 'package:ionicons/ionicons.dart';

import '../../models/sneaker_model.dart';
import 'appstyle.dart';
import 'new_shoes.dart';
import 'product_card.dart';

class HomeWiget extends StatelessWidget {
  const HomeWiget({
    super.key,
    required Future<List<Sneakers>> male,
    required this.tabIndex,
  }) : _male = male;

  final Future<List<Sneakers>> _male;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.405,
          child: FutureBuilder<List<Sneakers>>(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              } else {
                final mail = snapshot.data;
                return ListView.builder(
                    itemCount: mail!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final shoe = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage(
                                      id: shoe.id, category: shoe.category)));
                        },
                        child: ProductCard(
                            price: "\$ ${shoe.price}",
                            category: shoe.category,
                            id: shoe.id,
                            name: shoe.name,
                            image: shoe.imageUrl[0]),
                      );
                    });
              }
            },
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Shoes",
                    style: appStype(24, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductByCart(
                                    tabIndex: tabIndex,
                                  )));
                    },
                    child: Row(
                      children: [
                        Text(
                          "Show All",
                          style: appStype(22, Colors.black, FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Ionicons.arrow_forward_circle_outline,
                          size: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          child: FutureBuilder<List<Sneakers>>(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              } else {
                final mail = snapshot.data;
                return ListView.builder(
                    itemCount: mail!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final shoe = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NewShoes(imageUrl: shoe.imageUrl[1]),
                      );
                    });
              }
            },
          ),
        )
      ],
    );
  }
}
