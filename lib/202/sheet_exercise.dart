import 'package:flutter/material.dart';

class SheetExercise extends StatefulWidget {
  const SheetExercise({super.key});

  @override
  State<SheetExercise> createState() => _SheetExerciseState();
}

class _SheetExerciseState extends State<SheetExercise> {
  Color _backgroundColor = Colors.orange;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
            context: context,
            //backgroundColor: Colors.amber,
            //isScrollControlled: true,
            barrierColor: Colors.black.withOpacity(.5),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            )),
            builder: (context) {
              return _CustomBottomSheet(
                backgroundColor: Colors.amber,
              );
            },
          );

          if (result is bool) {
            setState(() {
              _backgroundColor = Colors.blue;
            });
          }
        },
        child: const Icon(Icons.share),
      ),
      appBar: AppBar(),
    );
  }
}

class _CustomBottomSheet extends StatefulWidget {
  final Color backgroundColor;

  const _CustomBottomSheet({
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  State<_CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<_CustomBottomSheet> {
  late Color _sheetBackgroundColor;

  @override
  void initState() {
    super.initState();
    _sheetBackgroundColor = widget.backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Divider(
            color: Colors.black,
            indent: MediaQuery.of(context).size.width * 0.40,
            endIndent: MediaQuery.of(context).size.width * 0.40,
            thickness: 3,
          ),
          Container(
            color: _sheetBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("sa"),
                  Container(
                    height: 300,
                    color: Colors.green,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).pop<bool>(true);
                        _sheetBackgroundColor = Colors.red;
                      });
                    },
                    child: Text("OK"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Expanded(
            child: SizedBox(),
            flex: 9,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 10),
            child: Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    Navigator.of(context).pop<bool>(true);
                  },
                )),
          )
        ],
      )
    ]);
  }
}
