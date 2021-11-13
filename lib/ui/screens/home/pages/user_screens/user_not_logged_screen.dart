import 'dart:async';

import 'package:anilist_app/core/bloc/user_bloc.dart';
import 'package:anilist_app/core/view_models/main_view_model.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:anilist_app/ui/values/strings.dart';
import 'package:anilist_app/ui/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class UserNotLoggedScreen extends StatefulWidget {
  @override
  _UserNotLoggedScreenState createState() => _UserNotLoggedScreenState();
}

class _UserNotLoggedScreenState extends State<UserNotLoggedScreen> {
  bool showField = false;

  @override
  Widget build(BuildContext context) {
    final mainViewModel = Provider.of<MainViewModel>(context);
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      body: Center(
        child: showField
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _controller,
                      autofocus: true,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: 'Paste your the code you received earlier',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.tertiaryColor,
                      ),
                      child: Text('Login'),
                      onPressed: () {
                        if (_controller.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("The code can't be empty"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          BlocProvider.of<UserBloc>(context)
                              .add(UserEventLogin(_controller.text.trim()));
                        }
                        // setState(() {
                        //   showField = false;
                        // });
                      },
                    )
                  ],
                ),
              )
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.tertiaryColor,
                ),
                child: Text("Login"),
                onPressed: () {
                  launch(
                    AUTH_URL,
                  ).then((value) => setState(() => showField = value));
                },
              ),
      ),
      // Stack(
      //   alignment: Alignment.center,
      //   children: [
      //     WebView(
      //       initialUrl: AUTH_URL,
      //       javascriptMode: JavascriptMode.unrestricted,
      //       onPageFinished: (url) {
      // mainViewModel.setToken(url);
      //       },
      //       onPageStarted: (url) {
      //         if (url != AUTH_URL) {
      //           setState(() {
      //             widget.showBackButton = true;
      //           });
      //         } else {
      //           widget.showBackButton = false;
      //         }
      //       },
      //       onWebViewCreated: (controller) {
      //         // if (mainViewModel.BEARER_TOKEN != null) {
      //         //   controller.clearCache();
      //         // }
      //         mainViewModel.fillWebViewController(controller);
      //         // Future.delayed(Duration(seconds: 10), () {
      //         //   print('Clearing cache');
      //         //   controller.clearCache();
      //         //   controller.loadUrl(AUTH_URL);
      //         // });
      //       },
      //     ),
      //     if (widget.showBackButton)
      //       Positioned(
      //         top: DEFAULT_PADDING_MAXIMUM,
      //         left: DEFAULT_PADDING_MEDIUM,
      //         child: FloatingActionButton(
      //           backgroundColor: primaryColor,
      //           child: Icon(Icons.arrow_back),
      //           onPressed: () {
      //             // _controller.goBack();
      //             mainViewModel.webViewPreviousScreen();
      //           },
      //         ),
      //       ),
      //   ],
      // ),
    );
  }
}
