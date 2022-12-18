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
          AppTranslationKeys.onBoardingTitle1: 'Orders',
          AppTranslationKeys.onBoardingTitle2: 'Payment',
          AppTranslationKeys.onBoardingTitle3: 'Restaurants',
          AppTranslationKeys.onBoardingBody1:
              'You can order whatever you want from home easily',
          AppTranslationKeys.onBoardingBody2:
              'Pay with your own visa card by only entering card number then follow the required steps',
          AppTranslationKeys.onBoardingBody3:
              'You can know the nearest restaurants from your home or around your area or country (Also you can optionally order from a certain restaurant)',
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
          //verification method screen
          AppTranslationKeys.chooseVerificationMethod:
              'Choose Verification Method',
          AppTranslationKeys.viaEmail: 'Via Email',
          AppTranslationKeys.viaPhone: 'Via Phone',
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
          //reset password screen
          AppTranslationKeys.typeYourNewPassword: 'Type Your New Password',
          AppTranslationKeys.newPassword: 'New password',
          AppTranslationKeys.confirm: 'Confirm',
          //home screen
          AppTranslationKeys.search: 'Search',
          //food view
          AppTranslationKeys.foods: 'Foods',
          AppTranslationKeys.from: 'From',
          //food details
          AppTranslationKeys.price: 'Price',
          AppTranslationKeys.rate: 'Rate',
          AppTranslationKeys.stock: 'Stock',
          AppTranslationKeys.totalPrice: 'Total Price',
          AppTranslationKeys.description: 'Description',
          AppTranslationKeys.amount: 'Amount',
          AppTranslationKeys.addToCart: 'Add To cart',
          //account
          AppTranslationKeys.editProfile: 'Edit Profile',
          AppTranslationKeys.switchAccount: 'Switch Account',
          AppTranslationKeys.notifications: 'Notifications',
          AppTranslationKeys.onlineStatus: 'Online Status',
          AppTranslationKeys.ordersHistory: 'Orders History',
          AppTranslationKeys.changePassword: 'Change Password',
          AppTranslationKeys.localBackup: 'Local Backup',
          AppTranslationKeys.delete: 'Delete',
          AppTranslationKeys.logout: 'Log Out',
          //lists and categories
          AppTranslationKeys.gender: 'Gender',
          AppTranslationKeys.male: 'Male',
          AppTranslationKeys.female: 'Female',
          //drawer
          AppTranslationKeys.homePage: 'Home Page',
          AppTranslationKeys.account: 'Account',
          AppTranslationKeys.restaurantPlaces: 'Restaurant Places',
          AppTranslationKeys.security: 'Security',
          AppTranslationKeys.policyAndTerms: 'Policy and Terms',
          AppTranslationKeys.licenses: 'Licenses',
          AppTranslationKeys.ads: 'Ads',
          AppTranslationKeys.settings: 'Settings',
          AppTranslationKeys.aboutApp: 'About App',
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
          AppTranslationKeys.checkIntenet: 'Check your internet connection',
          AppTranslationKeys.online: 'Online',
          AppTranslationKeys.pleaseWait: 'Please wait...',
          AppTranslationKeys.loggedInSuccessfully: 'Logged in Successfully',
          AppTranslationKeys.passwordSet: 'Password Set',
          AppTranslationKeys.warning: 'Warning',
          AppTranslationKeys.warningMessage:
              'This account and its information will be deleted permanently, Are you sure you want to confirm this step?',
          AppTranslationKeys.accountDeleted: 'Account deleted',
          AppTranslationKeys.loggingOut: 'Logging Out...',
          AppTranslationKeys.youLoggedOut: 'You logged out',
          AppTranslationKeys.addedToFavourites: 'was added to Favourites',
          AppTranslationKeys.removedFromFavourites:
              'was removed from Favourites',
          //errors
          AppTranslationKeys.pageNotFound: 'Page not found',
          AppTranslationKeys.somethingWentWrong: 'Something went wrong',
          AppTranslationKeys.noResults: 'No Results',
        },
        'ar': {
          //onboadring screen
          AppTranslationKeys.next: 'التالي',
          AppTranslationKeys.back: 'رجوع',
          AppTranslationKeys.skip: 'تخطي',
          AppTranslationKeys.getStarted: 'البدء',
          AppTranslationKeys.onBoardingTitle1: 'الطلبات',
          AppTranslationKeys.onBoardingTitle2: 'الدفع',
          AppTranslationKeys.onBoardingTitle3: 'المطاعم',
          AppTranslationKeys.onBoardingBody1:
              'يمكنك طلب اي شئ تريده من المنزل بكل سهولة',
          AppTranslationKeys.onBoardingBody2:
              'ادفع ببطاقة الفيزا خاصتك فقط بإدخال رقم البطاقة ثم اتبع الخطوات المطلوبة',
          AppTranslationKeys.onBoardingBody3:
              'يمكنك معرفة المطاعم الأقرب الى منزلك أو حول منطقتك أو بلدك (أيضاً يمكنك اختيارياً أن تطلب من مطعم معين)',
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
          //verification method screen
          AppTranslationKeys.chooseVerificationMethod: 'اختر اسلوب التحقق',
          AppTranslationKeys.viaEmail: 'عن طريق البريد',
          AppTranslationKeys.viaPhone: 'عن طريق الهاتف',
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
          //reset password screen
          AppTranslationKeys.typeYourNewPassword: 'اكتب كلمة مرورك الجديدة',
          AppTranslationKeys.newPassword: 'كلمة المرور الجديدة',
          AppTranslationKeys.confirm: 'تأكيد',
          AppTranslationKeys.resetYourPassword: 'اعادة تعيين كلمة مرورك',
          //home screen
          AppTranslationKeys.search: 'بحث',
          //food view
          AppTranslationKeys.foods: 'الاطعمة',
          AppTranslationKeys.from: 'من',
          //food details
          AppTranslationKeys.price: 'السعر',
          AppTranslationKeys.rate: 'التقييم',
          AppTranslationKeys.stock: 'المخزون',
          AppTranslationKeys.totalPrice: 'السعر الكلي',
          AppTranslationKeys.description: 'الوصف',
          AppTranslationKeys.amount: 'الكمية',
          AppTranslationKeys.addToCart: 'إضافة إلى العربة',
          //account
          AppTranslationKeys.editProfile: 'تعديل الملف الشخصي',
          AppTranslationKeys.switchAccount: 'تبديل الحساب',
          AppTranslationKeys.notifications: 'الاشعارات',
          AppTranslationKeys.onlineStatus: 'حالة الاتصال',
          AppTranslationKeys.ordersHistory: 'سجل الطلبات',
          AppTranslationKeys.changePassword: 'تغيير كلمة المرور',
          AppTranslationKeys.localBackup: 'النسخ الاحتياطي المحلي',
          AppTranslationKeys.delete: 'حذف',
          AppTranslationKeys.logout: 'تسجيل الخروج',
          //lists and categories
          AppTranslationKeys.gender: 'النوع',
          AppTranslationKeys.male: 'ذكر',
          AppTranslationKeys.female: 'انثى',
          //drawer
          AppTranslationKeys.homePage: 'الصفحة الرئيسية',
          AppTranslationKeys.account: 'الحساب',
          AppTranslationKeys.restaurantPlaces: 'أماكن المطاعم',
          AppTranslationKeys.security: 'الأمان',
          AppTranslationKeys.policyAndTerms: 'السياسة و الشروط',
          AppTranslationKeys.licenses: 'التراخيص',
          AppTranslationKeys.ads: 'الاعلانات',
          AppTranslationKeys.settings: 'الاعدادات',
          AppTranslationKeys.aboutApp: 'عن التطبيق',
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
          AppTranslationKeys.checkIntenet: 'تحقق من اتصالك بالانترنت',
          AppTranslationKeys.online: 'متصل',
          AppTranslationKeys.pleaseWait: 'الرجاء الانتظار...',
          AppTranslationKeys.loggedInSuccessfully: 'تم تسجيل الدخول بنجاح',
          AppTranslationKeys.passwordSet: 'تم تعيين كلمة المرور',
          AppTranslationKeys.warning: 'تحذير',
          AppTranslationKeys.warningMessage:
              'سيتم حذف هذا الحساب و معلوماته بشكل نهائي, هل انت متأكد من تأكيد تلك الخطوة؟',
          AppTranslationKeys.loggingOut: 'جاري تسجيل الخروج...',
          AppTranslationKeys.accountDeleted: 'تم حذف الحساب',
          AppTranslationKeys.youLoggedOut: 'لقد سجلت الخروج',
          AppTranslationKeys.addedToFavourites: 'اضيف الى المفضلة',
          AppTranslationKeys.removedFromFavourites: 'حذف من المفضلة',
          //errors
          AppTranslationKeys.pageNotFound: 'الصفحة غير موجودة',
          AppTranslationKeys.somethingWentWrong: 'حدث خطأ ما',
          AppTranslationKeys.noResults: 'لا نتائج',
        },
      };
}
