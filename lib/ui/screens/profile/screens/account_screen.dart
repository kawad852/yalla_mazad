import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/controller/profile/account_controller.dart';
import 'package:yalla_mazad/ui/widgets/custom_text_field.dart';
import 'package:yalla_mazad/utils/colors.dart';
import 'package:yalla_mazad/utils/images.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);

  final controller = AccountController.find;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: controller.nameController,
                color: MyColors.textFieldColor,
                readOnly: true,
                prefixIcon: SizedBox(
                  width: 60,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 18,
                      ),
                      SvgPicture.asset(
                        MyImages.navUser,
                        color: const Color(
                          0xffBDB5D0,
                        ),
                        width: 25,
                        height: 25,
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
                readOnly: true,
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
                        size: 22,
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
              Form(
                key: controller.formKey,
                child: CustomTextField(
                  controller: controller.phoneController,
                  validator: (text) {
                    if (text == '' || text!.isEmpty) {
                      return 'cannot be empty'.tr;
                    } else if (text.length < 9) {
                      return 'not a valid phone number'.tr;
                    }
                    return null;
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(
                      9,
                    ),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  color: MyColors.textFieldColor,
                  prefixIcon: SizedBox(
                    width: 105,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 18,
                        ),
                        const Icon(
                          Icons.phone_enabled_outlined,
                          color: Color(0xffBDB5D0),
                          size: 22,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 1,
                          height: 38,
                          color: MyColors.primary,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '+962',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  hint: 'phone'.tr,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  await controller.fetchUpdateUserData(
                      phone: controller.phoneController.text, context: context);
                },
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
        ),
      ),
    );
  }
}
