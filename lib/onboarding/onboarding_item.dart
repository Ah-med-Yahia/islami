import 'package:flutter/material.dart';
import 'package:islami/utils/app_theme.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(image),
        Text(
          title,
          style:
              textTheme.headlineSmall!.copyWith(color: AppTheme.primaryColor),
        ),
        Text(description,
            style:
                textTheme.headlineSmall!.copyWith(color: AppTheme.primaryColor))
      ],
    );
  }
}
