import 'package:flutter/material.dart';
import 'package:islami/screens/sura_details.dart';
import 'package:islami/services/sura_model.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_theme.dart';

class MostRecentlyItem extends StatelessWidget {
  const MostRecentlyItem({super.key, required this.sura});

  final SuraModel sura;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: sura);
      },
      child: Container(
        height: double.infinity,
        width: screenSize.width * .7,
        padding: const EdgeInsets.only(left: 12, right: 8),
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  sura.englishName,
                  style:
                      textTheme.headlineSmall!.copyWith(color: AppTheme.black),
                ),
                Text(
                  sura.arabicName,
                  style:
                      textTheme.headlineSmall!.copyWith(color: AppTheme.black),
                ),
                Text(
                  '${sura.ayaCounts} Verses',
                  style: textTheme.titleSmall!.copyWith(color: AppTheme.black),
                ),
              ],
            ),
            Image.asset(
              AppAssets.mostRecentlyBackGround,
              height: screenSize.height * .14,
              width: screenSize.width * .3,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
