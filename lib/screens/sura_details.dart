import 'package:flutter/material.dart';
import 'package:islami/services/quran_services.dart';
import 'package:islami/services/sura_model.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:islami/widgets/loading_indicator.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  static const routeName = 'sura_details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  late SuraModel sura;

  Future<void> loadSura() async {
    String suraContent = await QuranServices.loadSuraFile(sura.num);
    ayat = suraContent.split('\r\n');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenHeight = MediaQuery.of(context).size.height;
    sura = ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (ayat.isEmpty) {
      loadSura();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(sura.englishName),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  AppAssets.leftHeaderSuraDetails,
                  height: screenHeight * .1,
                  fit: BoxFit.fill,
                ),
                Text(
                  sura.arabicName,
                  style: textTheme.headlineSmall!
                      .copyWith(color: AppTheme.primaryColor),
                ),
                Image.asset(AppAssets.rightHeaderSuraDetails,
                    height: screenHeight * .1, fit: BoxFit.fill),
              ],
            ),
          ),
          Expanded(
            child: ayat.isEmpty
                ? const LoadingIndicator()
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: ayat.length,
                    itemBuilder: (context, index) {
                      return Text(
                        ayat[index],
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
            AppAssets.suraDetailsFooter,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
