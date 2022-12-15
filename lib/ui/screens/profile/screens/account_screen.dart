import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/profile/account_controller.dart';
import 'package:yalla_mazad/ui/widgets/custom_text_field.dart';
import 'package:yalla_mazad/utils/colors.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);

  final controller = AccountController.find;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: controller.nameController,
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
                    Icons.account_box_outlined,
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
            hint: 'name'.tr,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: controller.emailController,
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
                    Icons.alternate_email,
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
            hint: 'email'.tr,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: controller.phoneController,
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
                    Icons.phone_enabled_outlined,
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
            hint: 'phone'.tr,
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
}
