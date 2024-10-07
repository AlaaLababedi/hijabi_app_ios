import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../controller/auth_controller.dart';

import '../widgets/custom_flat_buttom.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/have_account.dart';
import '../widgets/welcome_register.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

      final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            WelcomeRegister(
              title: 'Registration ',
              descrption: 'Register',
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomTextField(
              hintText: 'Full Name',
              prefixIcon: Icons.person,
              onChanged: (value) {
                controller.name.value = value;
              },
            ),
            CustomTextField(
              hintText: 'E-mail',
              prefixIcon: Icons.mail_outline,
              onChanged: (value) {
                controller.email.value = value;
              },
            ),
            CustomTextField(
              hintText: 'Password',
              prefixIcon: Icons.lock,
              obscureText: true,
              onChanged: (value) {
                controller.password.value = value;
              },
            ),
            CustomTextField(
              hintText: 'Confirm Password',
              prefixIcon: Icons.lock,
              obscureText: true,
              onChanged: (value) {
                controller.confirmPassword.value = value;
              },
            ),
            SizedBox(
              height: 25.h,
            ),
            Obx(() => CustomFlatButton(
                  onPressed: () async {
                    if (!controller.isLoading.value) {
                      bool success = await controller.register();
                      if (success) {
                        Get.offAllNamed('/HomePage');
                      } else {
                        if (controller.errorMessage.isNotEmpty) {
                          Get.snackbar('Error', controller.errorMessage.value,
                              backgroundColor: AppColors.greyColor);
                        }
                      }
                    }
                  },
                  title: controller.isLoading.value ? 'Loading...' : 'Log in',
                  width: 327.w,
                  height: 53.h,
                  kTextcolor: AppColors.whiteColor,
                )),
            SizedBox(
              height: 90.h,
            ),
            HaveAnAccountTextButton(
              onTap: () {
                Get.offNamed('/LoginView');
              },
              title: 'Have an account?',
              subtitle: 'Log in',
            ),
          ]),
        ),
      ),
    );
  }
}
