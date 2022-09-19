import 'package:get/get.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          //onboadring screen
          AppTranslationKeys.next: 'Next',
          AppTranslationKeys.back: 'Back',
          AppTranslationKeys.skip: 'Skip',
          AppTranslationKeys.getStarted: 'Get Started',
          //auth screen
          AppTranslationKeys.appTitle: 'Your Chef',
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
          //verify account screen
          AppTranslationKeys.verifyYourAccount: 'Verify Your Account',
          AppTranslationKeys.verifyAccountWarning:
              'Make sure to write the sent code properly to verify your account',
          AppTranslationKeys.verify: 'Verify',
          AppTranslationKeys.haveNotReceiveCode:
              "If you haven't receive any code tap",
          AppTranslationKeys.resend: 'Resend',
          //validation
          AppTranslationKeys.requiredField: 'Required Field',
          AppTranslationKeys.nameLength: 'Name must be at least 3 characters',
          AppTranslationKeys.notValidPhone: 'Not a valid phone number',
          AppTranslationKeys.notValidEmail: 'Not a valid email',
          AppTranslationKeys.passwordLength:
              'Password must be at least 8 characters',
          AppTranslationKeys.validPassword:
              'Password must contain A-Z,a-z,0-9 and symbols',
          AppTranslationKeys.confirmPasswordValidation:
              'Write the same password to confirm',
          //errors
          AppTranslationKeys.pageNotFound: 'Page not found',
        },
        'ar': {
          //onboadring screen
          AppTranslationKeys.next: 'التالي',
          AppTranslationKeys.back: 'رجوع',
          AppTranslationKeys.skip: 'تخطي',
          AppTranslationKeys.getStarted: 'البدء',
          //auth screen
          AppTranslationKeys.appTitle: 'طباخك',
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
          //verify account screen
          AppTranslationKeys.verifyYourAccount: 'تأكيد حسابك',
          AppTranslationKeys.verifyAccountWarning:
              'تأكد من كتابة الكود المرسل بطريقة صحيحة لتأكيد حسابك',
          AppTranslationKeys.verify: 'تأكيد',
          AppTranslationKeys.haveNotReceiveCode: "ان لم تستلم اي كود اضغط",
          AppTranslationKeys.resend: 'اعادة الارسال',
          //validation
          AppTranslationKeys.requiredField: 'حقل مطلوب',
          AppTranslationKeys.nameLength:
              'يجب ان يتكون الاسم من 3 أحرف على الأقل',
          AppTranslationKeys.notValidPhone: 'رقم الهاتف غير صحيح',
          AppTranslationKeys.notValidEmail: 'البريد الالكتروني غير صحيح',
          AppTranslationKeys.passwordLength:
              'يجب ان تتكون كلمة المرور من 8 أحرف على الأقل',
          AppTranslationKeys.validPassword:
              'و رموز A-Z,a-z,0-9 يجب ان تحتوي كلمة المرور على',
          AppTranslationKeys.confirmPasswordValidation:
              'اكتب نفس كلمة المرور للتأكيد',
          //errors
          AppTranslationKeys.pageNotFound: 'الصفحة غير موجودة',
        },
      };
}
