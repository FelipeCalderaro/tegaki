import 'package:flutter/widgets.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar()
      : super(
          preferredSize: Size(
            double.infinity,
            200,
          ),
          child: Stack(),
        );
}
