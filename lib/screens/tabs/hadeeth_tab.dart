import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/widgets/hadeeth_item.dart';

class HadeethTab extends StatelessWidget {
  const HadeethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12,bottom: 20),
      child: CarouselSlider.builder(
        itemCount: 50, 
        itemBuilder:(_,index,__)=>  HadeethItem(index: index,), 
        options: CarouselOptions(
          height: double.infinity,
          enlargeCenterPage: true,
          enlargeFactor: .2,
        )),
    );
  }
}