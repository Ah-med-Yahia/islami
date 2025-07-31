import 'package:flutter/material.dart';
import 'package:islami/utils/app_theme.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key,this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CircularProgressIndicator(
        color:color?? AppTheme.primaryColor,
      ),
    );
  }
}
