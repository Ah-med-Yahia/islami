import 'package:flutter/material.dart';
import 'package:islami/services/sura_model.dart';
import 'package:islami/utils/app_assets.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({super.key, required this.sura});

  final SuraModel sura;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.suraNumberFrame))),
          child: Text(
            '${sura.num}',
            style: textTheme.titleLarge,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sura.englishName,
              style: textTheme.titleLarge,
            ),
            Text(
              '${sura.ayaCounts} Verses',
              style: textTheme.titleSmall,
            ),
          ],
        ),
        const Spacer(),
        Text(
          sura.arabicName,
          style: textTheme.titleLarge,
        )
      ],
    );
  }
}
