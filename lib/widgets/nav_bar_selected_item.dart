import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/utils/app_theme.dart';

class NavBarSelectedItem extends StatelessWidget {
  const NavBarSelectedItem({super.key, required this.imageName});

  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 12),
      decoration: BoxDecoration(
        color: AppTheme.black.withOpacity(.6),
        borderRadius: BorderRadius.circular(66)
      ),
      child: SvgPicture.asset(
        imageName,
        height: 22,
        width: 22,
        fit: BoxFit.fill,
        colorFilter: const ColorFilter.mode(AppTheme.white,BlendMode.srcIn),
      ),
    );
  }
}
