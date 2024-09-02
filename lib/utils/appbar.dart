import 'package:flutter/material.dart';
import 'package:technews/utils/colors.dart';
import 'package:technews/utils/text.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  const appbar({Key? key})
      : preferredSize = const Size.fromHeight(50),
        super(key: key);

  @override
  final Size preferredSize;
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Appcolors.black,
      elevation: 0,
      title: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            modifiedtext(text: 'tech', size: 14, color: Appcolors.primary)
          ],
        ),
      ),
    );
  }
}
