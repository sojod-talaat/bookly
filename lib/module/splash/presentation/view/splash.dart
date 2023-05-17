import 'package:bookly/app-router.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets_const.dart';
import 'package:bookly/module/home/presentation/view/home-page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  //value from 0 to 1
  late AnimationController _animationController;
  late Animation<Offset> _slidAnimation;
  @override
  void initState() {
    super.initState();
    animateFunction();
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).push(AppRouter.kHomePage);
    });
  }

  void animateFunction() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _slidAnimation = Tween(begin: const Offset(0, 4), end: Offset.zero)
        .animate(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetConst.logo),
          SizedBox(
            height: 12,
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) => SlideTransition(
                position: _slidAnimation, child: const Text('Reed Free Books')),
          )
        ],
      )),
    );
  }
}
