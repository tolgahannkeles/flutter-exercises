import 'package:flutter/material.dart';

class FormExercise extends StatefulWidget {
  const FormExercise({super.key});

  @override
  State<FormExercise> createState() => _FormExerciseState();
}

class _FormExerciseState extends State<FormExercise> {
  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              validator: FormFieldValidator().isNotEmpty,
            ),
            TextFormField(
              validator: FormFieldValidator().isNotEmpty,
            ),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(
                  child: Text("sa"),
                  value: "first",
                ),
                DropdownMenuItem(
                  child: Text("as"),
                  value: "second",
                ),
                DropdownMenuItem(
                  child: Text("sa2"),
                  value: "thirds",
                ),
              ],
              onChanged: (value) {},
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  print("success");
                }
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? value) {
    return (value?.isNotEmpty ?? false) ? null : "Bu alan boş olamaz";
  }
}
