import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:islami/onboarding/onboarding_item.dart';
import 'package:islami/onboarding/onboarding_model.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String routeName = 'onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnboardingModel> onboardingItemsModel = [
    OnboardingModel(
        description: 'Welcome To Islmi App',
        image: AppAssets.onboardingScreen1,
        title: ''),
    OnboardingModel(
        description: 'We Are Very Excited To Have You In Our Community',
        image: AppAssets.onboardingScreen2,
        title: 'Welcome To Islami'),
    OnboardingModel(
        description: 'Read, and your Lord is the Most Generous',
        image: AppAssets.onboardingScreen3,
        title: 'Reading the Quran'),
    OnboardingModel(
        description: 'Praise the name of your Lord, the Most High',
        image: AppAssets.onboardingScreen4,
        title: 'Bearish'),
    OnboardingModel(
        description:
            'You can listen to the Holy Quran Radio through the application for free and easily',
        image: AppAssets.onboardingScreen5,
        title: 'Holy Quran Radio'),
  ];

  double currentPosition = 0;

  PageController pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      currentPosition = pageController.page!;
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              AppAssets.header,
              height: MediaQuery.sizeOf(context).height * .15,
              fit: BoxFit.fitWidth,
            ),
            const Spacer(),
            SizedBox(
                height: MediaQuery.sizeOf(context).height * .7,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: 5,
                  itemBuilder: (context, index) => OnboardingItem(
                      image: onboardingItemsModel[index].image,
                      title: onboardingItemsModel[index].title,
                      description: onboardingItemsModel[index].description),
                )),
            const Spacer(
              flex: 1,
            ),
            Stack(alignment: Alignment.center, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: currentPosition.toInt() != 0,
                    child: TextButton(
                        onPressed: () {
                          pageController.animateToPage(
                              currentPosition.toInt() - 1,
                              duration: const Duration(microseconds: 300),
                              curve: Curves.bounceIn);
                        },
                        child: Text('Back',
                            style: textTheme.titleSmall!
                                .copyWith(color: AppTheme.primaryColor))),
                  ),
                  TextButton(
                      onPressed: () async {
                        if (currentPosition.toInt() ==
                            onboardingItemsModel.length - 1) {
                          Navigator.of(context)
                              .pushReplacementNamed(HomeScreen.routeName);
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool('onboarding_done', true);
                        } else {
                          pageController.animateToPage(
                              currentPosition.toInt() + 1,
                              duration: const Duration(microseconds: 300),
                              curve: Curves.bounceIn);
                        }
                      },
                      child: Text(
                        currentPosition.toInt() ==
                                onboardingItemsModel.length - 1
                            ? 'Finish'
                            : 'Next',
                        style: textTheme.titleSmall!
                            .copyWith(color: AppTheme.primaryColor),
                      )),
                ],
              ),
              DotsIndicator(
                dotsCount: onboardingItemsModel.length,
                position: currentPosition,
                onTap: (position) {
                  pageController.animateToPage(position,
                      duration: const Duration(microseconds: 300),
                      curve: Curves.bounceIn);
                },
                decorator: DotsDecorator(
                  color: AppTheme.white, // Inactive color
                  activeColor: AppTheme.primaryColor,
                  size: const Size(8, 8),
                  activeSize: const Size(20.0, 8.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
