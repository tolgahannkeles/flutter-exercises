import 'package:exercise/101/appbar.dart';
import 'package:exercise/101/buttons.dart';
import 'package:exercise/101/card.dart';
import 'package:exercise/101/column_row.dart';
import 'package:exercise/101/container_sized_box.dart';
import 'package:exercise/101/custom_widgets.dart';
import 'package:exercise/101/image.dart';
import 'package:exercise/101/indicator.dart';
import 'package:exercise/101/life_cycle.dart';
import 'package:exercise/101/list_tile.dart';
import 'package:exercise/101/list_view.dart';
import 'package:exercise/101/list_view_builder.dart';
import 'package:exercise/101/navigation.dart';
import 'package:exercise/101/navigation_detail.dart';
import 'package:exercise/101/page_view.dart';
import 'package:exercise/101/scaffold.dart';
import 'package:exercise/101/stack.dart';
import 'package:exercise/101/statefull.dart';
import 'package:exercise/101/text_exercise.dart';
import 'package:exercise/101/text_field.dart';
import 'package:exercise/202/model_excercise/model.dart';
import 'package:exercise/202/service/service_ui_get.dart';
import 'package:exercise/202/service/service_ui_post.dart';
import 'package:exercise/202/tab_bar.dart';
import 'package:exercise/demos/colors_demo.dart';
import 'package:exercise/demos/colors_lifecycle_demo.dart';
import 'package:exercise/demos/list_view_demo.dart';
import 'package:exercise/theme/widget_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '202/package.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(),
      debugShowCheckedModeBanner: false,
      home: const WidgetSizeExercise(),
    );
  }
}

/*
ThemeData.dark().copyWith(
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.green,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: EdgeInsets.zero,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.amber,
        ),
        inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            iconColor: Colors.amber,
            border: OutlineInputBorder(),
            labelStyle: TextStyle(color: Colors.black),
            floatingLabelStyle: TextStyle(color: Colors.pink)),
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Colors.red,
          selectionHandleColor: Colors.red,
        ),
        listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.zero,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actionsIconTheme: IconThemeData(color: Colors.amber),
        ),
      ),

*/
