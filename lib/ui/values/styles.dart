import 'package:anilist_app/ui/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';

class TegakiTextStyles {
  static final TextStyle title = GoogleFonts.satisfy(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final TextStyle buttonHighlight = GoogleFonts.francoisOne(
    fontSize: 18,
    color: Colors.white,
  );

  static final TextStyle infoButton = GoogleFonts.francoisOne(
    fontSize: 16,
    color: Colors.white,
  );

  static final TextStyle callout = GoogleFonts.palanquinDark(
    fontSize: 32,
    color: Colors.white,
  );

  static final TextStyle regularTitle = GoogleFonts.overpass(
    fontSize: 17,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle regularSubtitle = GoogleFonts.overpass(
    fontSize: 15,
    color: AppColors.lightColor,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle appBarTitle = GoogleFonts.overpass(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle regularBold = GoogleFonts.overpass(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle regular = GoogleFonts.overpass(
    color: Colors.white,
  );

  static final TextStyle secondaryText = GoogleFonts.overpass(
    color: Colors.grey,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle characterNameText = GoogleFonts.overpass(
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontSize: 44.8,
  );

  static final TextStyle characterAlternativeNamesText = GoogleFonts.overpass(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static final TextStyle staffNameText = GoogleFonts.overpass(
    color: Colors.white,
    fontWeight: FontWeight.w800,
    fontSize: 44.8,
  );

  static final TextStyle staffAlternativeNamesText = GoogleFonts.overpass(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static final MarkdownStyleSheet markdownStyleSheetDarkMode =
      MarkdownStyleSheet(
    textAlign: WrapAlignment.start,
    a: regularSubtitle.copyWith(color: AppColors.secondaryColor),
    strong: regularBold.copyWith(fontSize: 21),
    p: regular,
    h1: regular,
    h2: regular,
    h3: regular,
    h4: regular,
    h5: regular,
    h6: regular,
    blockquote: regular,
    blockquoteDecoration: BoxDecoration(
      color: Colors.transparent,
    ),
    blockquotePadding: EdgeInsets.all(8),
  );
}
