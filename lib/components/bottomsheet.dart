import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technews/components/components.dart';
import 'package:technews/utils/colors.dart';
import 'package:technews/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';

void showMyBottomSheet(
    BuildContext context, String title, String description, imageurl, url) {
  showBottomSheet(
      backgroundColor: Appcolors.black,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      elevation: 20,
      context: context,
      builder: (context) {
        return MyBottomSheetLayout(
          description: description,
          imageurl: imageurl,
          title: title,
          url: url,
        );
      });
}

_launchURL(String url) async {
  var urls = Uri.parse(url);
  try {
    await canLaunchUrl(urls) ? await launchUrl(urls) : throw 'Errors';
  } catch (e) {
    log(e.toString());
  }
}

class MyBottomSheetLayout extends StatelessWidget {
  final String title, description, imageurl, url;
  const MyBottomSheetLayout(
      {super.key,
      required this.title,
      required this.description,
      required this.imageurl,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetImage(imageurl: imageurl, title: title),
          Container(
            padding: const EdgeInsets.all(10),
            child:
                modifiedtext(color: Colors.white, size: 16, text: description),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Read Full Article",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchURL(url);
                    },
                  style: GoogleFonts.lato(color: Colors.blue.shade400))
            ])),
          )
        ],
      ),
    );
  }
}
