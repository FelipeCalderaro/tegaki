import 'package:anilist_app/core/utils/route_generator.dart';
import 'package:anilist_app/ui/values/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  CurvedAnimation? _curvedAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _curvedAnimation = CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOutBack,
    );
    _animation =
        Tween<double>(begin: 0.35, end: 0.46).animate(_curvedAnimation!);
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      _animationController!.forward().then((_) {
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pushReplacementNamed(RouteNames.BASE_PAGE);
        });
      });
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tertiaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              brightness: Brightness.dark,
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _animation!,
              builder: (context, child) => Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * _animation!.value,
              ),
            ),
          )
        ],
      ),
    );
  }
}
