import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double angel = 0;
  int currentZekr = 0;
  List<String> zekry = [
    'سبحان الله',
    'الحمد الله',
    'الله أكبر',
    'لا حول ولا قوة الا بالله '
  ];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            height: screenSize.height * .551,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                      margin: const EdgeInsets.only(
                        left: 45,
                      ),
                      child: Image.asset(AppAssets.sebhaHeader)),
                ),
                InkWell(
                    onTap: onClick,
                    child: Transform.rotate(
                        angle: angel, child: Image.asset(AppAssets.sebhaBody))),
                Positioned(
                  left: screenSize.width * .16,
                  top: screenSize.height * .26,
                  child: SizedBox(
                    width: screenSize.width * .6,
                    child: Column(
                      children: [
                        Text(
                          zekry[currentZekr],
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text('$counter', style: textTheme.headlineMedium),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void onClick() {
    angel += 20;
    counter++;
    if (counter % 33 == 0) {
      currentZekr++;
    }
    if (currentZekr == zekry.length) {
      currentZekr = 0;
      counter = 0;
    }
    setState(() {});
  }
}
