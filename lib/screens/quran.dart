import 'package:flutter/material.dart';
import 'package:islami/services/quran_services.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:islami/widgets/sura_item.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Sura List',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
            child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: 114,
          itemBuilder: (context, index) {
            return SuraItem(sura: QuranServices.suras[index]);
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: AppTheme.white,
              indent: screenWidth * .1,
              endIndent: screenWidth * .1,
            );
          },
        )),
      ],
    );
  }
}
