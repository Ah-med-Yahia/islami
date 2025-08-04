import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/screens/hadeeth_datails.dart';
import 'package:islami/services/hadeeth_model.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:islami/widgets/loading_indicator.dart';

class HadeethItem extends StatefulWidget {
  const HadeethItem({super.key, required this.index});
  final int index;

  @override
  State<HadeethItem> createState() => _HadeethItemState();
}

class _HadeethItemState extends State<HadeethItem> {
  HadeethModel? hadeeth;

  Future<void> loadHadeeth() async {
    String hadeethContent =
        await rootBundle.loadString('text/h${widget.index + 1}.txt');
    List<String> hadeethLines = hadeethContent.split('\r\n');
    String title = hadeethLines.first;
    hadeethLines.removeAt(0);
    hadeeth = HadeethModel(
        content: hadeethLines, num: widget.index + 1, title: title);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (hadeeth == null) {
      loadHadeeth();
    }
    Size screenSize = MediaQuery.sizeOf(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadeethDatails.routeName, arguments: hadeeth);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AppAssets.leftHadeethCorner,
                    height: screenSize.height * .1,
                    fit: BoxFit.fill,
                  ),
                  if (hadeeth != null)
                    Expanded(
                      child: Text(
                        hadeeth!.title,
                        textAlign: TextAlign.center,
                        style: textTheme.headlineSmall!
                            .copyWith(color: AppTheme.black),
                      ),
                    ),
                  Image.asset(
                    AppAssets.rightHadeethCorner,
                    height: screenSize.height * .1,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(AppAssets.hadeethCardBackground))),
              child: hadeeth != null
                  ? ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: hadeeth!.content.length,
                      itemBuilder: (_, index) => Text(
                        hadeeth!.content[index],
                        style: textTheme.titleMedium!
                            .copyWith(color: AppTheme.black),
                        textAlign: TextAlign.center,
                      ),
                      separatorBuilder: (_, index) => const SizedBox(
                        height: 5,
                      ),
                    )
                  : const LoadingIndicator(
                      color: AppTheme.black,
                    ),
            )),
            Image.asset(
              AppAssets.hadeethFooter,
              width: double.infinity,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }
}
