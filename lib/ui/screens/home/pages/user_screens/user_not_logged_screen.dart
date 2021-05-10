import 'dart:async';

import 'package:anilist_app/core/view_models/main_view_model.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/strings.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UserNotLoggedScreen extends StatefulWidget {
  bool showBackButton = false;
  @override
  _UserNotLoggedScreenState createState() => _UserNotLoggedScreenState();
}

class _UserNotLoggedScreenState extends State<UserNotLoggedScreen> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          WebView(
            initialUrl: AUTH_URL,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (url) {
              mainViewModel.setToken(url);
            },
            onPageStarted: (url) {
              if (url != AUTH_URL) {
                setState(() {
                  widget.showBackButton = true;
                });
              } else {
                widget.showBackButton = false;
              }
            },
            onWebViewCreated: (controller) {
              // if (mainViewModel.BEARER_TOKEN != null) {
              //   controller.clearCache();
              // }
              mainViewModel.fillWebViewController(controller);
              // Future.delayed(Duration(seconds: 10), () {
              //   print('Clearing cache');
              //   controller.clearCache();
              //   controller.loadUrl(AUTH_URL);
              // });
            },
          ),
          if (widget.showBackButton)
            Positioned(
              top: DEFAULT_PADDING_MAXIMUM,
              left: DEFAULT_PADDING_MEDIUM,
              child: FloatingActionButton(
                backgroundColor: primaryColor,
                child: Icon(Icons.arrow_back),
                onPressed: () {
                  // _controller.goBack();
                  mainViewModel.webViewPreviousScreen();
                },
              ),
            ),
        ],
      ),
    );
  }
}
