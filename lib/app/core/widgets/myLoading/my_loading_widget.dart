import 'package:flutter/material.dart';
import 'package:movie2/app/core/widgets/app_colors.dart';
import 'package:movie2/app/core/widgets/myText/my_text_widget.dart';

class MyLoading extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  final String? text;

  const MyLoading(
      {Key? key,
      this.color = loadingColor,
      this.height = 100,
      this.width = 100,
      this.text = 'Carregando...'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: CircularProgressIndicator(
                color: color,
              ),
            ),
            Center(
                child: MyText.h3Regular(
              text!,
              color: color,
            )),
          ],
        ));
  }
}
