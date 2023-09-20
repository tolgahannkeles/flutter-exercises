import 'package:exercise/101/image.dart';
import 'package:exercise/101/navigation_detail.dart';
import 'package:flutter/material.dart';

class NavigationExercise extends StatefulWidget {
  const NavigationExercise({Key? key}) : super(key: key);

  @override
  _NavigationExerciseState createState() => _NavigationExerciseState();
}

class _NavigationExerciseState extends State<NavigationExercise> {
  List<int> selectedItems = [];

  void addSelectedItems(int index) {
    setState(() {
      selectedItems.add(index);
      print(index);
    });
  }

  void removeSelectedItem(int index) {
    if (selectedItems.contains(index)) {
      setState(() {
        selectedItems.remove(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: TextButton(
              onPressed: () async {
                final response = await NavigateManager.NavigateToWidget<bool>(
                    context,
                    NavigationDetail(
                      isConfirmed: selectedItems.contains(index),
                    ));
                if (response == true) {
                  addSelectedItems(index);
                } else {
                  removeSelectedItem(index);
                }
              },
              child: Placeholder(
                fallbackHeight: 150,
                strokeWidth: 5,
                color: selectedItems.contains(index) ? Colors.green : Colors.red,
              ),
            ),
          );
        },
      ),
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class NavigateManager {
  static void NavigateToWidgetBasic(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) {
            return widget;
          },
          settings: const RouteSettings(),
          fullscreenDialog: true),
    );
  }

  static Future<T?> NavigateToWidget<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
          builder: (context) {
            return widget;
          },
          settings: const RouteSettings(),
          fullscreenDialog: true),
    );
  }
}
