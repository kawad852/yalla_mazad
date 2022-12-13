import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/ui/widgets/custom_text_field.dart';
import 'package:yalla_mazad/utils/colors.dart';
import '../../../../controller/profile/edit_password_controller.dart';

class EditPasswordScreen extends StatelessWidget {
  EditPasswordScreen({Key? key}) : super(key: key);

  final controller = EditPasswordController.find;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          _getOldPasswordTextField(),
          const SizedBox(
            height: 10,
          ),
          _getPasswordTextField(),
          const SizedBox(
            height: 20,
          ),
          _getConfirmPasswordTextField(),
          const SizedBox(
            height: 20,
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
                  'next'.tr,
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
    );
  }

  _getOldPasswordTextField() {
    return CustomTextField(
      controller: controller.oldPasswordController,
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
      hint: 'old password'.tr,
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

  _getConfirmPasswordTextField() {
    return CustomTextField(
      controller: controller.confirmPasswordController,
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
      hint: 'confirm password'.tr,
    );
  }
}
