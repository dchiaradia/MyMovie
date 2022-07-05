import 'package:flutter/material.dart';
import 'package:movie2/app/core/widgets/myButton/styles/button_styles.dart';

class MyButton extends StatelessWidget {
  MyButton({Key? key}) : super(key: key);

  //inicializo as variaveis padroes dos botoes
  String text = '';
  double height = 50;
  IconData? mySufixIcon;
  IconData? myPrefixIcon;
  double width = 120;
  ButtonStyle style = yellowMediumColor();
  Color backgroundColor = const Color(0xff000000);
  Color color = const Color(0xffFFFFFF);
  var callback;

  MyButton.defaultButton(
      {Key? key,
      msg,
      cb,
      sizeHeight = 30.0,
      styleButton = defaultColor,
      sizeWidth = 120.0,
      IconData? prefixIcon = null,
      IconData? sufixIcon = null})
      : super(key: key) {
    style = styleButton();
    text = msg;
    height = sizeHeight;
    callback = cb;
    width = sizeWidth;
    myPrefixIcon = prefixIcon;
    mySufixIcon = sufixIcon;
  }

  MyButton.darkButton(
      {Key? key,
      msg,
      cb,
      sizeHeight = 30.0,
      styleButton = defaultColor,
      sizeWidth = 120.0,
      IconData? prefixIcon = null,
      IconData? sufixIcon = null})
      : super(key: key) {
    style = darkBlueColor();
    text = msg;
    height = sizeHeight;
    callback = cb;
    myPrefixIcon = prefixIcon;
    mySufixIcon = sufixIcon;
    width = double.parse(sizeWidth.toString());
  }

  MyButton.whiteButton(
      {Key? key,
      msg,
      cb,
      sizeHeight = 30.0,
      styleButton = defaultColor,
      sizeWidth = 120.0,
      IconData? prefixIcon = null,
      IconData? sufixIcon = null})
      : super(key: key) {
    style = whiteColor();
    text = msg;
    height = sizeHeight;
    callback = cb;
    myPrefixIcon = prefixIcon;
    mySufixIcon = sufixIcon;
    width = sizeWidth;
  }

  MyButton.next(cb, {Key? key}) : super(key: key) {
    style = yellowMediumColor();
    text = 'Proximo';
    height = 50;
    callback = cb;
  }

  MyButton.jump(cb, {Key? key}) : super(key: key) {
    style = greyLightColor();
    text = 'Pular';
    height = 39;
    callback = cb;
  }

  MyButton.cancelTrip(cb, {Key? key}) : super(key: key) {
    style = greyLightColor();
    text = 'Cancelar Corrida';
    height = 50;
    callback = cb;
  }

  MyButton.signUpDark(cb, {Key? key}) : super(key: key) {
    style = yellowMediumColor();
    text = 'Cadastrar';
    height = 50;
    callback = cb;
  }

  MyButton.signUpMedium(cb, {Key? key}) : super(key: key) {
    style = yellowLightColor();
    text = 'Cadastrar';
    height = 50;
    callback = cb;
  }

  MyButton.signUpLight(cb, {Key? key}) : super(key: key) {
    style = greyLightColor();
    text = 'Cadastrar';
    height = 50;
    callback = cb;
  }

  MyButton.saveMedium(cb, {Key? key}) : super(key: key) {
    style = yellowLightColor();
    text = 'Salvar';
    height = 50;
    callback = cb;
  }

  MyButton.save(cb, {Key? key}) : super(key: key) {
    style = yellowMediumColor();
    text = 'Salvar';
    height = 50;
    callback = cb;
  }

  MyButton.enterDark(cb, {Key? key}) : super(key: key) {
    style = yellowMediumColor();
    text = 'Entrar';
    height = 50;
    callback = cb;
  }

  MyButton.proceed(cb, {Key? key}) : super(key: key) {
    style = yellowMediumColor();
    text = 'Continuar';
    height = 50;
    callback = cb;
  }

  MyButton.yellowMediumColor(this.text, this.callback, this.height, {Key? key})
      : style = yellowMediumColor(),
        super(key: key);

  MyButton.greyLightColor(this.text, this.callback, this.height, {Key? key})
      : style = greyLightColor(),
        super(key: key);

  MyButton.yellowLightColor(this.text, this.callback, this.height, {Key? key})
      : style = yellowLightColor(),
        super(key: key);

  MyButton.customized(
      this.text, this.callback, this.height, this.backgroundColor, this.color,
      {Key? key})
      : style = ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            foregroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radiusSize))),
            textStyle: MaterialStateProperty.all(const TextStyle(
              fontFamily: 'Rubik',
              fontStyle: FontStyle.normal,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ))),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('tamanho do botao:' + width.toString());
    return SizedBox(
        width: width == 0 ? 100 : width,
        child: Container(
          height: this.height.toDouble(),
          child: ElevatedButton(
            onPressed: callback,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (myPrefixIcon != null)
                    ? Icon(
                        myPrefixIcon,
                        size: this.height * 0.6,
                      )
                    : SizedBox.shrink(),
                (myPrefixIcon != null)
                    ? SizedBox(
                        width: 12,
                      )
                    : SizedBox.shrink(),
                Text(text),
                (mySufixIcon != null)
                    ? SizedBox(
                        width: 12,
                      )
                    : SizedBox.shrink(),
                (mySufixIcon != null)
                    ? Icon(
                        mySufixIcon,
                        size: this.height * 0.6,
                      )
                    : SizedBox.shrink(),
              ],
            ),
            style: style,
          ),
        ));
  }
}
