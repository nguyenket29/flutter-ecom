import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom/views/shared/appstyle.dart';

class StaggerTitle extends StatefulWidget {
  const StaggerTitle(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.price});
  final String imageUrl;
  final String name;
  final String price;

  @override
  State<StaggerTitle> createState() => _StaggerTitleState();
}

class _StaggerTitleState extends State<StaggerTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.imageUrl,
              fit: BoxFit.fill,
            ),
            Container(
              padding: const EdgeInsets.only(top: 12),
              height: 75,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: appStypeWithHeight(
                          20, Colors.black, FontWeight.w700, 1),
                    ),
                    Text(
                      widget.price,
                      style: appStypeWithHeight(
                          20, Colors.black, FontWeight.w500, 1),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
