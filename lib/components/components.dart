import 'package:flutter/material.dart';
import 'package:technews/utils/colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Divider(
        color: Appcolors.lightwhite,
      ),
    );
  }
}
