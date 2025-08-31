import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_theme.dart';

class RadioItem extends StatefulWidget {
  const RadioItem({super.key});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool opened = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(12),
      height: 133,
      width: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
            fit: BoxFit.fill, image: AssetImage(AppAssets.radioItemBackground)),
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            'Radio Ibrahim Al-Akdar',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: AppTheme.black),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              opened
                  ? InkWell(
                      onTap: () {
                        opened = false;
                        setState(() {});
                      },
                      child: SvgPicture.asset(
                        AppAssets.pauseIcon,
                        width: 24,
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        opened = opened = true;
                        setState(() {});
                      },
                      child: SvgPicture.asset(
                        AppAssets.resumeIcon,
                        width: 24,
                      ),
                    ),
              SvgPicture.asset(AppAssets.soundIcon),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
