import 'package:exercise/101/card.dart';
import 'package:exercise/101/image.dart';
import 'package:exercise/101/text_exercise.dart';
import 'package:flutter/material.dart';

class PageViewExercise extends StatefulWidget {
  const PageViewExercise({Key? key}) : super(key: key);

  @override
  _PageViewExercisetate createState() => _PageViewExercisetate();
}

class _PageViewExercisetate extends State<PageViewExercise> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _updateCurrentPAgeIndex(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        onPageChanged: (index) {
          _updateCurrentPAgeIndex(index);
        },
        controller: _pageController,
        children: [
          ImageExercise(),
          TextExercise(),
          CardExercise(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("Current Page $_currentPage"),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: FloatingActionButton(
              onPressed: _previousPage,
              child: Icon(Icons.navigate_before),
            ),
          ),
          FloatingActionButton(
            onPressed: _nextPage,
            child: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }

  void _previousPage() {
    _pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.bounceOut);
  }

  void _nextPage() {
    _pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.bounceIn);
  }
}
