import 'package:get/get.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          AppTranslationKeys.yourChief: 'Your Chief',
          AppTranslationKeys.email: 'Email',
          AppTranslationKeys.password: 'Password',
          AppTranslationKeys.forgotPassword: 'Forgot Password?',
          AppTranslationKeys.login: 'Login',
          AppTranslationKeys.register: 'Register',
          AppTranslationKeys.fname: 'First name',
          AppTranslationKeys.lname: 'Last name',
          AppTranslationKeys.phone: 'Phone',
          AppTranslationKeys.confirmPass: 'Confirm password',
          AppTranslationKeys.pleaseWait: 'Please wait...',
        },
        'ar': {
          AppTranslationKeys.yourChief: 'طباخك',
          AppTranslationKeys.email: 'البريد الالكتروني',
          AppTranslationKeys.password: 'كلمة المرور',
          AppTranslationKeys.forgotPassword: 'هل نسيت كلمة المرور؟',
          AppTranslationKeys.login: 'تسجيل الدخول',
          AppTranslationKeys.register: 'تسجيل',
          AppTranslationKeys.fname: 'الاسم الأول',
          AppTranslationKeys.lname: 'الاسم الأخير',
          AppTranslationKeys.phone: 'الهاتف',
          AppTranslationKeys.confirmPass: 'تأكيد كلمة المرور',
          AppTranslationKeys.pleaseWait: 'الرجاء الانتظار...',
        },
      };
}
