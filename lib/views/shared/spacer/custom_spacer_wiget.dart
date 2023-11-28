import 'package:flutter/material.dart';

class CustomSpacer extends StatefulWidget {
  const CustomSpacer({super.key});

  @override
  State<CustomSpacer> createState() => _CustomSpacerState();
}

class _CustomSpacerState extends State<CustomSpacer> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 25,
    );
  }
}
