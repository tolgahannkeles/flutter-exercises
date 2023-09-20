import 'package:exercise/101/card.dart';
import 'package:exercise/101/image.dart';
import 'package:exercise/101/text_exercise.dart';
import 'package:flutter/material.dart';

class TabBarExercise extends StatefulWidget {
  const TabBarExercise({Key? key}) : super(key: key);

  @override
  _TabBarExerciseState createState() => _TabBarExerciseState();
}

class _TabBarExerciseState extends State<TabBarExercise> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: _MyTabs.values.length, vsync: this);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabs.values.length,
        child: Scaffold(
          extendBody: true,
          floatingActionButton: FloatingActionButton(onPressed: () {
            _tabController.animateTo(_MyTabs.home.index);
          }),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
              notchMargin: 5,
              shape: const CircularNotchedRectangle(),
              child: TabBar(
                controller: _tabController,
                onTap: (int index) {},
                tabs: _MyTabs.values
                    .map((e) => Tab(
                          child: Text(e.name),
                        ))
                    .toList(),
              )),
          body: TabBarView(
              //physics: const NeverScrollableScrollPhysics(), // Scroll ile dönmeyi kapatır
              controller: _tabController,
              children: [
                CardExercise(),
                const ImageExercise(),
                TextExercise(),
              ]),
        ));
  }
}

enum _MyTabs { home, settings, profile }
