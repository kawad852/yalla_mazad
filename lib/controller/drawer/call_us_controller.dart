import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emailjs/emailjs.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CallUsController extends GetxController {
  static CallUsController get find => Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  sendEmailJS(String name, String email, String message, context) async {
    Loader.show(context);
    Map<String, dynamic> templateParams = {
      'from_name': name,
      'from_email': email,
      'message': message,
    };

    try {
      await EmailJS.send(
        'service_6yvn22j',
        'template_9e1ihsd',
        templateParams,
        const Options(
          publicKey: 'fuv1XgMJ-nHQawFbU',
          privateKey: 'RByVJIwGIQs6TMorQUR1y',
        ),
      );
      Loader.hide();
      Fluttertoast.showToast(msg: 'success');
    } catch (error) {
      Loader.hide();
      Fluttertoast.showToast(msg: 'fail');
    }
  }
}
