import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:your_chief/Core/Constants/app_images.dart';
import 'package:your_chief/Core/Constants/app_translation_keys.dart';
import 'package:your_chief/View/Responsiveness/orientation_widget.dart';
import 'package:your_chief/View/Screens/Auth/login_view.dart';
import 'package:your_chief/View/Screens/Auth/register_view.dart';
import 'package:your_chief/View/Widgets/title_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [LoginView(), RegisterView()];

    final List<Tab> tabs = [
      Tab(
        text: AppTranslationKeys.login.tr,
      ),
      Tab(
        text: AppTranslationKeys.register.tr,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              String languageCode = 'en';
              if (Get.locale != Locale('ar')) languageCode = 'ar';
              Get.updateLocale(Locale(languageCode));
            },
            icon: Text(Get.locale!.languageCode),
          )
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: OrientationWidget(
          portrait: _AuthScreenPortrait(
            pages: pages,
            tabs: tabs,
          ),
          landscape: _AuthScreenLandscape(
            pages: pages,
            tabs: tabs,
          ),
        ),
      ),
    );
  }
}

class _AuthScreenPortrait extends StatelessWidget {
  final List<Widget> pages;
  final List<Tab> tabs;
  const _AuthScreenPortrait({Key? key, required this.pages, required this.tabs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 90),
      child: Column(
        children: [
          const TitleWidget(),
          const SizedBox(
            height: 40,
          ),
          Image.asset(
            AppImages.yourChief,
            width: 124,
            height: 124,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: kToolbarHeight,
            child: TabBar(
              indicatorColor: Theme.of(context).colorScheme.secondary,
              indicatorWeight: 4,
              padding: const EdgeInsets.symmetric(horizontal: 44),
              tabs: tabs,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: TabBarView(children: pages),
          ),
        ],
      ),
    );
  }
}

class _AuthScreenLandscape extends StatelessWidget {
  final List<Widget> pages;
  final List<Tab> tabs;
  const _AuthScreenLandscape(
      {Key? key, required this.pages, required this.tabs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxHeight < 280) {
              return FittedBox(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AppImages.yourChief,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      const TitleWidget(),
                    ],
                  ),
                ),
              );
            }
            return FittedBox(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 90, horizontal: 80),
                child: Column(
                  children: [
                    const TitleWidget(),
                    const SizedBox(
                      height: 40,
                    ),
                    Image.asset(
                      AppImages.yourChief,
                      width: 144,
                      height: 144,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child: SizedBox(
                  height: kToolbarHeight,
                  child: TabBar(
                    indicatorColor: Theme.of(context).colorScheme.secondary,
                    indicatorWeight: 4,
                    padding: const EdgeInsets.symmetric(horizontal: 44),
                    tabs: tabs,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 18,
                    left: 18,
                    top: 22,
                  ),
                  child: TabBarView(children: pages),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
