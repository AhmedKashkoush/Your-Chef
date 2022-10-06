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
          AppTranslationKeys.or: 'Or',
          AppTranslationKeys.loginGoogle: 'Login with Google',
          AppTranslationKeys.loginFacebook: 'Login with Facebook',
          AppTranslationKeys.registerGoogle: 'Register with Google',
          AppTranslationKeys.registerFacebook: 'Register with Facebook',
          //add profile photo screen
          AppTranslationKeys.photoAlert:
              "If you want you can add a photo to your account, skip this step if you don't",
          AppTranslationKeys.uploadAPhoto: 'Upload A Photo',
          AppTranslationKeys.skipThisStep: 'Skip This Step',
          AppTranslationKeys.uploadAnotherPhoto: 'Upload Another Photo',
          AppTranslationKeys.continue_: 'Continue',
          AppTranslationKeys.camera: 'Camera',
          AppTranslationKeys.gallery: 'Gallery',
          //account verify account screen
          AppTranslationKeys.verifyYourAccount: 'Verify Your Account',
          AppTranslationKeys.verifyAccountWarning:
              'Make sure to write the sent code properly to verify your account',
          AppTranslationKeys.verify: 'Verify',
          AppTranslationKeys.haveNotReceiveCode:
              "If you haven't receive any code tap",
          AppTranslationKeys.resend: 'Resend',
          //verification complete screen
          AppTranslationKeys.congratulations: 'Congratulations',
          AppTranslationKeys.congratulatingMessage:
              'You are now our customer, go to login page to complete authentication process',
          AppTranslationKeys.goToLoginPage: 'Go To Login Page',
          //forgot password screen
          AppTranslationKeys.forgotPasswordMessage:
              'Type your email address to help us match your account and provide you with new password',
          AppTranslationKeys.resetYourPassword: 'Reset Your Password',
          //email verify account screen
          AppTranslationKeys.verifyYourEmail: 'Verify Your Email',
          AppTranslationKeys.verifyEmailWarning:
              'We sent you a code, Check your email and make sure to write the sent code properly to verify the email',
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
          //messages
          AppTranslationKeys.loginedSuccessfully: 'Logined Successfully',
          AppTranslationKeys.passwordSet: 'Password Set',
          //errors
          AppTranslationKeys.pageNotFound: 'Page not found',
          AppTranslationKeys.somethingWentWrong: 'Something went wrong',
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
          AppTranslationKeys.or: 'أو',
          AppTranslationKeys.loginGoogle: 'تسجيل الدخول عبر جوجل',
          AppTranslationKeys.loginFacebook: 'تسجيل الدخول عبر فيسبوك',
          AppTranslationKeys.registerGoogle: 'التسجيل عبر جوجل',
          AppTranslationKeys.registerFacebook: 'التسجيل عبر فيسبوك',
          //add profile photo screen
          AppTranslationKeys.photoAlert:
              "اذا كنت تريد يمكنك اضافة صورة الى حسابك, ان كنت لا ترغب في ذلك تخط تلك الخطوة",
          AppTranslationKeys.uploadAPhoto: 'رفع صورة',
          AppTranslationKeys.skipThisStep: 'تخطى هذه الخطوة',
          AppTranslationKeys.uploadAnotherPhoto: 'رفع صورة اخرى',
          AppTranslationKeys.continue_: 'استمر',
          AppTranslationKeys.camera: 'الكاميرا',
          AppTranslationKeys.gallery: 'المعرض',
          //account verify account screen
          AppTranslationKeys.verifyYourAccount: 'تأكيد حسابك',
          AppTranslationKeys.verifyAccountWarning:
              'تأكد من كتابة الكود المرسل بطريقة صحيحة لتأكيد حسابك',
          AppTranslationKeys.verify: 'تأكيد',
          AppTranslationKeys.haveNotReceiveCode: "ان لم تستلم اي كود اضغط",
          AppTranslationKeys.resend: 'اعادة الارسال',
          //email verify account screen
          AppTranslationKeys.verifyYourEmail: 'تأكيد بريدك الالكتروني',
          AppTranslationKeys.verifyEmailWarning:
              'لقد ارسلنا اليك كودا, تفقد بريدك الالكتروني و تأكد من كتابة الكود المرسل بطريقة صحيحة لتأكيد البريد',
          //verification complete screen
          AppTranslationKeys.congratulations: 'تهانينا',
          AppTranslationKeys.congratulatingMessage:
              'انت الان عميل لدينا, توجه الى صفحة تسجيل الدخول لاتمام عملية المصادقة',
          AppTranslationKeys.goToLoginPage: 'الذهاب لصفحة تسجيل الدخول',
          //forgot password screen
          AppTranslationKeys.forgotPasswordMessage:
              'اكتب بريدك الالكتروني لتساعدنا على الوصول الى حسابك و توفير كلمة المرور الجديدة لك',
          AppTranslationKeys.resetYourPassword: 'اعادة تعيين كلمة مرورك',
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
          //messages
          AppTranslationKeys.loginedSuccessfully: 'تم تسجيل الدخول بنجاح',
          AppTranslationKeys.passwordSet: 'تم تعيين كلمة المرور',
          //errors
          AppTranslationKeys.pageNotFound: 'الصفحة غير موجودة',
          AppTranslationKeys.somethingWentWrong: 'حدث خطأ ما',
        },
      };
}
