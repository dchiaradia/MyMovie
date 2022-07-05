import 'package:flutter/material.dart';

import 'styles/text_styles_medium.dart';
import 'styles/text_styles_regular.dart';
import 'styles/text_styles_semi_bold.dart';

class MyText extends StatelessWidget {
  const MyText(
      {Key? key,
      required this.text,
      required this.style,
      this.color,
      this.alignment})
      : super(key: key);

  final String text;
  final TextStyle style;
  final Color? color;
  final TextAlign? alignment;

  const MyText.h1Regular(this.text, {this.color, this.alignment})
      : style = h1RegularStyle;
  const MyText.h2Regular(this.text, {this.color, this.alignment})
      : style = h2RegularStyle;
  const MyText.h3Regular(this.text, {this.color, this.alignment})
      : style = h3RegularStyle;
  const MyText.h4Regular(this.text, {this.color, this.alignment})
      : style = h4RegularStyle;
  const MyText.h5Regular(this.text, {this.color, this.alignment})
      : style = h5RegularStyle;
  const MyText.h6Regular(this.text, {this.color, this.alignment})
      : style = h6RegularStyle;

  const MyText.h1Medium(this.text, {this.color, this.alignment})
      : style = h1MediumStyle;
  const MyText.h2Medium(this.text, {this.color, this.alignment})
      : style = h2MediumStyle;
  const MyText.h3Medium(this.text, {this.color, this.alignment})
      : style = h3MediumStyle;
  const MyText.h4Medium(this.text, {this.color, this.alignment})
      : style = h4MediumStyle;
  const MyText.h5Medium(this.text, {this.color, this.alignment})
      : style = h5MediumStyle;
  const MyText.h6Medium(this.text, {this.color, this.alignment})
      : style = h6MediumStyle;

  const MyText.h1SemiBold(this.text, {this.color, this.alignment})
      : style = h1SemiBoldStyle;
  const MyText.h2SemiBold(this.text, {this.color, this.alignment})
      : style = h2SemiBoldStyle;
  const MyText.h3SemiBold(this.text, {this.color, this.alignment})
      : style = h3SemiBoldStyle;
  const MyText.h4SemiBold(this.text, {this.color, this.alignment})
      : style = h4SemiBoldStyle;
  const MyText.h5SemiBold(this.text, {this.color, this.alignment})
      : style = h5SemiBoldStyle;
  const MyText.h6SemiBold(this.text, {this.color, this.alignment})
      : style = h6SemiBoldStyle;

  // static get bodyStyle => null;
  // MyText.body(this.text, {Color color = luxBlackColor})
  //     : style = bodyStyle.copyWith(color: color)

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: this.alignment != null ? this.alignment : TextAlign.start,
      style: TextStyle(
        fontFamily: this.style.fontFamily,
        fontSize: this.style.fontSize,
        fontWeight: this.style.fontWeight,
        fontStyle: this.style.fontStyle,
        color: this.color != null ? this.color : Colors.white,
      ),
    );
  }
}
