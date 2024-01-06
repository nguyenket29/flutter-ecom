import 'package:flutter/material.dart';
import 'package:flutter_ecom/views/shared/appstyle.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn(
      {super.key, this.onPress, required this.label, required this.btnColor});
  final void Function()? onPress;
  final String label;
  final Color btnColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width * 0.255,
        decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: btnColor, style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(9))),
        child: Center(
          child: Text(
            label,
            style: appStype(16, btnColor, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
