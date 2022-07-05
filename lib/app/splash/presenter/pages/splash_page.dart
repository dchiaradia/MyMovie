import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final SplashControllerG controller = Get.find<SplashControllerG>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Column(
        children: [
          const SizedBox(
            height: 250,
          ),
          const Icon(
            Icons.movie_rounded,
            color: Colors.orange,
            size: 72,
          ),
          const Text(
            'MyMovie_',
            style: TextStyle(
                fontSize: 48.0, fontFamily: 'Horizon', color: Colors.white),
          ),
          Center(
            child: SizedBox(
                child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: 24.0,
                      fontFamily: 'Horizon',
                      color: Colors.grey),
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      RotateAnimatedText('OS MELHORES FILMES'),
                      RotateAnimatedText('LANÇAMENTOS'),
                      RotateAnimatedText('AGORA APERTEM OS CINTOS'),
                      RotateAnimatedText('VAMOS COMEÇAR!'),
                    ],
                    onFinished: () {
                      controller.goToDestiny('/home');
                    },
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ],
            )),
          ),
        ],
      ),
    ));
  }
}
