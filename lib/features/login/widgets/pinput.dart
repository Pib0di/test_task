import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_task/theme.dart';

class PinputCustom extends StatelessWidget {
  const PinputCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: PinCodeTextField(
        appContext: context,
        length: 5,
        blinkWhenObscuring: true,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          borderWidth: 2,
          borderRadius: BorderRadius.zero,
          fieldHeight: 50,
          fieldWidth: 40,
          activeColor: LightColors.grey,
          inactiveColor: LightColors.grey,
          selectedColor: LightColors.grey,
          selectedFillColor: LightColors.grey,
          disabledColor: Colors.transparent,
          inactiveFillColor: LightColors.grey,
          activeFillColor: Colors.transparent,
          // shapeBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: Colors.black),
          // ),
        ),
        cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        // errorAnimationController: errorController,
        // controller: textEditingController,
        keyboardType: TextInputType.number,
        boxShadows: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
            blurRadius: 10,
          )
        ],

        beforeTextPaste: (text) {
          debugPrint("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      ),
    );
  }
}
