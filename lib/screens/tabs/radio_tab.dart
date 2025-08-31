import 'package:flutter/material.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:islami/widgets/radio_item.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppTheme.black.withOpacity(.8)),
              child: TabBar(
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppTheme.primaryColor),
                labelStyle:
                    textTheme.titleMedium!.copyWith(color: AppTheme.black),
                unselectedLabelStyle: textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.normal),
                tabs: const [
                  Tab(
                    text: "Radio",
                  ),
                  Tab(text: "Recjters"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                      itemBuilder: (_, builder) => const RadioItem()),
                  ListView.builder(
                      itemBuilder: (_, builder) => const RadioItem())
                ],
              ),
            ), // TabBar
          ],
        ),
      ), // Column
    ); // DefaultTabController
  }
}
