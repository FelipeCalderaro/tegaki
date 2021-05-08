import 'package:anilist_app/core/view_models/main_view_model.dart';
import 'package:anilist_app/ui/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UserNotLoggedScreen extends StatelessWidget {
  // WebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);
    return Scaffold(
      body: WebView(
        initialUrl: AUTH_URL,
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (url) {
          mainViewModel.setToken(url);
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
    );
  }
}
