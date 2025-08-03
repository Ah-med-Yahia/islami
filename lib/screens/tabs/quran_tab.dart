import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/screens/sura_details.dart';
import 'package:islami/services/quran_services.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:islami/widgets/most_recently_sec.dart';
import 'package:islami/widgets/sura_item.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: AppTheme.white,
            style: textTheme.titleMedium,
            decoration: InputDecoration(
              hintText: 'Sura Name',
              prefixIcon: SvgPicture.asset(
                AppAssets.quranIcon,
                colorFilter: const ColorFilter.mode(
                    AppTheme.primaryColor, BlendMode.srcIn),
                height: 28,
                width: 28,
                fit: BoxFit.scaleDown,
              ),
            ),
            onChanged: (query) {
              QuranServices.searchSura(query);
              setState(() {});
            },
          ),
        ),
        if (QuranServices.mostRecentlySuars.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: MostRecentlySec(
              mostRecentlySuars: QuranServices.mostRecentlySuars.reversed.toList(),
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Sura List',
            style: textTheme.titleMedium,
          ),
        ),
        Expanded(
            child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: QuranServices.suras.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () async {
                  QuranServices.addSuraToMostRecently(
                      QuranServices.suras[index]);
                  await Navigator.of(context).pushNamed(
                      SuraDetailsScreen.routeName,
                      arguments: QuranServices.suras[index]);
                  setState(() {});
                },
                child: SuraItem(sura: QuranServices.suras[index]));
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
