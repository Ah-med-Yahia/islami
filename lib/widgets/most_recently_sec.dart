import 'package:flutter/material.dart';
import 'package:islami/services/sura_model.dart';
import 'package:islami/widgets/most_recently_item.dart';

class MostRecentlySec extends StatelessWidget {
  const MostRecentlySec({super.key, required this.mostRecentlySuars});

  final List<SuraModel> mostRecentlySuars;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Most Recently',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .16,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: mostRecentlySuars.length,
            itemBuilder: (_, index) =>
                MostRecentlyItem(sura: mostRecentlySuars[index]),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              width: 10,
            ),
          ),
        ),
      ],
    );
  }
}
