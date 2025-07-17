import 'package:flutter/material.dart';
import 'package:sobatkas/core/styles/colors.dart';
import '../widgets/hero_card.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.primaryScafolld,
      child: ListView(children: [HeroCard()]),
    );
  }
}
