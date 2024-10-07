import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/user_model.dart';
import '../data/repositories/auth_repo.dart';

class AuthController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var confirmPassword = ''.obs;


  final AuthRepository authRepository = Get.find<AuthRepository>();

  Future<bool> login() async {
    isLoading.value = true;
    if (!Get.isDialogOpen!) {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
    }

    try {
      UserModel user =
          UserModel(name: '', email: email.value, password: password.value);
      await authRepository.login(user);
      return true;
    } catch (e) {
      errorMessage.value = _handleError(e.toString());
      return false;
    } finally {
      if (Get.isDialogOpen!) {
        Get.back();
      }
      isLoading.value = false;
    }
  }

  Future<bool> register() async {
    if (password.value != confirmPassword.value) {
      errorMessage.value = 'The two passwords do not match.';
      return false;
    }

    isLoading.value = true;

    if (!Get.isDialogOpen!) {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
    }

    try {
      UserModel user = UserModel(
          name: name.value, email: email.value, password: password.value);
      await authRepository.register(user);
      return true;
    } catch (e) {
      errorMessage.value = _handleError(e.toString());
      return false;
    } finally {
      if (Get.isDialogOpen!) {
        Get.back();
      }
      isLoading.value = false;
    }
  }

  String _handleError(String error) {
    if (error.contains('INVALID_CREDENTIALS') ||
        error.contains('INVALID_INPUT')) {
      return 'The credentials you entered are invalid.';
    } else if (error.contains('INVALID_EMAIL')) {
      return 'The email you entered is incorrect.';
    } else if (error.contains('INVALID_PASSWORD_LENGTH')) {
      return 'The password must be at least 8 characters.';
    } else if (error.contains('EMAIL_NOT_FOUND')) {
      return 'The email you entered does not exist.';
    } else if (error.contains('SERVER_ERROR')) {
      return 'Server error. Please try again later.';
    } else if (error.contains('RESOURCE_ALREADY_EXISTS')) {
      return 'Email Already Exists.';
    } else if (error.contains('The name field is required.')) {
      return 'The name field is required.';
    } else {
      return 'Unexpected error: $error. Please try again.';
    }
  }
}
/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/user_model.dart';
import '../data/repositories/auth_repo.dart';

class AuthController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final AuthRepository authRepository = Get.find<AuthRepository>();

  // دالة تسجيل الدخول
  Future<bool> login() async {
    return await _authenticate(() async {
      UserModel user = UserModel(name: '', email: email.value, password: password.value);
      await authRepository.login(user);
    });
  }

  // دالة التسجيل
  Future<bool> register() async {
    if (password.value != confirmPassword.value) {
      errorMessage.value = 'The passwords do not match.';
      return false;
    }

    return await _authenticate(() async {
      UserModel user = UserModel(name: name.value, email: email.value, password: password.value);
      await authRepository.register(user);
    });
  }

  // دالة خاصة لمعالجة المصادقة (التحقق) مع إظهار وإخفاء التحميل
  Future<bool> _authenticate(Future<void> Function() authFunction) async {
    isLoading.value = true;
    _showLoadingDialog();

    try {
      await authFunction();
      return true;
    } catch (e) {
      errorMessage.value = _handleError(e.toString());
      return false;
    } finally {
      _hideLoadingDialog();
      isLoading.value = false;
    }
  }

  // إظهار نافذة التحميل
  void _showLoadingDialog() {
    if (!Get.isDialogOpen!) {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );
    }
  }

  // إخفاء نافذة التحميل
  void _hideLoadingDialog() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  // دالة معالجة الأخطاء وتحسين الرسائل
  String _handleError(String error) {
    if (error.contains('INVALID_CREDENTIALS') || error.contains('INVALID_INPUT')) {
      return 'The credentials you entered are invalid.';
    } else if (error.contains('INVALID_EMAIL')) {
      return 'The email you entered is incorrect.';
    } else if (error.contains('INVALID_PASSWORD_LENGTH')) {
      return 'The password must be at least 8 characters.';
    } else if (error.contains('EMAIL_NOT_FOUND')) {
      return 'The email you entered does not exist.';
    } else if (error.contains('SERVER_ERROR')) {
      return 'Server error. Please try again later.';
    } else if (error.contains('RESOURCE_ALREADY_EXISTS')) {
      return 'Email already exists.';
    } else if (error.contains('The name field is required.')) {
      return 'The name field is required.';
    } else {
      return 'Unexpected error: $error. Please try again.';
    }
  }
}
 */