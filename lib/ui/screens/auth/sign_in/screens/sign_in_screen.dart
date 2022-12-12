import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/authentication/sign_in_controller.dart';
import 'package:yalla_mazad/ui/widgets/custom_text_field.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';
import 'package:yalla_mazad/utils/screen_size.dart';


class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final controller = SignInController.find;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenSize.phoneSize(
          30,
          height: false,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            _getPhoneTextField(),
            const SizedBox(
              height: 10,
            ),
            _getPasswordTextField(),
            const SizedBox(
              height: 20,
            ),
            _getORow(),
            const SizedBox(
              height: 20,
            ),
            Text(
              'sign in using'.tr,
              style: const TextStyle(
                fontSize: 16,
                color: Color(
                  0xff333333,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _getSignInMethods(),
            const SizedBox(
              height: 90,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: MyColors.primary,
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                ),
                child: Center(
                  child: Text(
                    'login'.tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  _getPhoneTextField() {
    return CustomTextField(
      controller: controller.phoneController,
      color: MyColors.textFieldColor,
      prefixIcon: SizedBox(
        width: 60,
        child: Row(
          children: [
            const SizedBox(
              width: 18,
            ),
            const Icon(
              Icons.local_phone_outlined,
              color: Color(0xffBDB5D0),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 1,
              height: 38,
              color: MyColors.primary,
            ),
          ],
        ),
      ),
      hint: 'phone number'.tr,
    );
  }

  _getPasswordTextField() {
    return CustomTextField(
      controller: controller.passwordController,
      color: MyColors.textFieldColor,
      obscureText: true,
      prefixIcon: SizedBox(
        width: 60,
        child: Row(
          children: [
            const SizedBox(
              width: 18,
            ),
            const Icon(
              Icons.lock_open_outlined,
              color: Color(0xffBDB5D0),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 1,
              height: 38,
              color: MyColors.primary,
            ),
          ],
        ),
      ),
      hint: 'password'.tr,
    );
  }

  _getORow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Expanded(
          child: Divider(
            indent: 10,
            endIndent: 10,
            thickness: 0.7,
            color: MyColors.primary,
          ),
        ),
        Text(
          'or'.tr,
          style: const TextStyle(
            color: MyColors.primary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Expanded(
          child: Divider(
            indent: 10,
            endIndent: 10,
            color: MyColors.primary,
            thickness: 0.7,
            height: 10,
          ),
        ),
      ],
    );
  }

  _getSignInMethods() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 50,
          height: 50,
          child: Image.asset(
            MyImages.appleSignIn,
          ),
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: Image.asset(
            MyImages.googleSignIn,
          ),
        ),
        SizedBox(
          width: 50,
          height: 50,
          child: Image.asset(
            MyImages.facebookSignIn,
          ),
        ),
      ],
    );
  }
}
