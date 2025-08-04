import 'package:flutter/material.dart';
import 'package:islami/services/hadeeth_model.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_theme.dart';

class HadeethDatails extends StatelessWidget {
  const HadeethDatails({super.key});

  static const String routeName = 'hadeeth_details';

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenHeight = MediaQuery.of(context).size.height;
    HadeethModel hadeeth =
        ModalRoute.of(context)!.settings.arguments as HadeethModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hadith ${hadeeth.num}',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppAssets.leftHeaderDetails,
                  height: screenHeight * .1,
                  fit: BoxFit.fill,
                ),
                Expanded(
                  child: Text(
                    hadeeth.title,
                    textAlign: TextAlign.center,
                    style: textTheme.headlineSmall!
                        .copyWith(color: AppTheme.primaryColor),
                  ),
                ),
                Image.asset(AppAssets.rightHeaderDetails,
                    height: screenHeight * .1, fit: BoxFit.fill),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: hadeeth.content.length,
              itemBuilder: (context, index) {
                return Text(
                  hadeeth.content[index],
                  textAlign: TextAlign.center,
                  style: textTheme.titleLarge!
                      .copyWith(color: AppTheme.primaryColor),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
            ),
          ),
          Image.asset(
            AppAssets.hadeethFooter,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
