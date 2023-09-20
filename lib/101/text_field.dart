import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldExercise extends StatefulWidget {
  const TextFieldExercise({Key? key}) : super(key: key);

  @override
  _TextFieldExerciseState createState() => _TextFieldExerciseState();
}

class _TextFieldExerciseState extends State<TextFieldExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            autofillHints: [AutofillHints.email],
            inputFormatters: [
              TextInputFormatter.withFunction(
                (oldValue, newValue) {
                  if (newValue.text == "a") {
                    return oldValue;
                  } else {
                    return oldValue;
                  }
                },
              )
            ],
            maxLength: 20,
            buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength}) {
              return Container(
                height: 10,
                width: 10.0 * (currentLength ?? 0),
                color: Colors.green,
              );
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.mail),
              border: OutlineInputBorder(),
              hintText: "Hint Text",
              labelText: "Label Text",
              fillColor: Colors.grey,
              filled: true,
            ),
          ),
          TextField(),
        ],
      ),
    );
  }
}
