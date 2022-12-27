import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yalla_mazad/api/auth/update_user_api.dart';
import 'package:yalla_mazad/model/auth/update_user_model.dart';

import '../../utils/app_constants.dart';
import '../../utils/shared_prefrences.dart';

class AccountController extends GetxController {
  static AccountController get find => Get.find();
  final TextEditingController nameController =
      TextEditingController(text: MySharedPreferences.name);
  final TextEditingController emailController =
      TextEditingController(text: MySharedPreferences.email);

  final TextEditingController phoneController =
      TextEditingController(text: '+962${MySharedPreferences.phone}');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  UpdateUserModel? updateUserModel;

  Future fetchUpdateUserData({
    required String phone,
    required BuildContext context,
  }) async {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        Loader.show(context);
        // OverLayLoader.showLoading(context);
        updateUserModel = await UpdateUserApi().data(
          phone: phone,
        );
        if (updateUserModel == null) {
          Fluttertoast.showToast(msg: AppConstants.failedMessage);
          Loader.hide();
          return;
        }
        if (updateUserModel!.code == 200) {
          MySharedPreferences.phone =
              updateUserModel!.user!.phone!.substring(4);
          Fluttertoast.showToast(msg: updateUserModel!.msg!);
        } else if (updateUserModel!.code == 500) {
          Fluttertoast.showToast(msg: 'incorrect phone or password'.tr);
        } else {
          Fluttertoast.showToast(msg: updateUserModel!.msg!);
        }
        Loader.hide();
      }
    }
  }
}
