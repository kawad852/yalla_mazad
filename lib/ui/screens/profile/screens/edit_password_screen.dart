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
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: Text(
                'current password'.tr,
                style: const TextStyle(
                  color: MyColors.primary,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            GetBuilder<EditPasswordController>(builder: (value) {
              return CustomTextField(
                controller: controller.oldPasswordController,
                color: MyColors.textFieldColor,
                obscureText: value.oldIsVisible,
                obscureChar: '*',
                hint: 'current password'.tr,
                suffixIcon: IconButton(
                  onPressed: () {
                    value.oldIsVisible = !value.oldIsVisible;
                    value.update();
                  },
                  icon: Icon(value.oldIsVisible
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined),
                ),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'new password'.tr,
                style: const TextStyle(
                  color: MyColors.primary,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            GetBuilder<EditPasswordController>(builder: (value) {
              return CustomTextField(
                controller: controller.passwordController,
                color: MyColors.textFieldColor,
                obscureText: value.newIsVisible,
                obscureChar: '*',
                hint: 'new password'.tr,
                suffixIcon: IconButton(
                  onPressed: () {
                    value.newIsVisible = !value.newIsVisible;
                    value.update();
                  },
                  icon: Icon(value.newIsVisible
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined),
                ),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                'confirm new password'.tr,
                style: const TextStyle(
                  color: MyColors.primary,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            GetBuilder<EditPasswordController>(
              builder: (value) {
                return CustomTextField(
                  controller: controller.confirmPasswordController,
                  color: MyColors.textFieldColor,
                  obscureText: value.newIsVisible,
                  obscureChar: '*',
                  hint: 'confirm new password'.tr,
                  suffixIcon: IconButton(
                    onPressed: () {
                      value.newIsVisible = !value.newIsVisible;
                      value.update();
                    },
                    icon: Icon(value.newIsVisible
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined),
                  ),
                );
              }
            ),
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
                    'save'.tr,
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
}
