import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureExercise extends StatefulWidget {
  const SecureExercise({super.key});

  @override
  State<SecureExercise> createState() => _SecureExerciseState();
}

class _SecureExerciseState extends State<SecureExercise> {
  final _secureStorage = const FlutterSecureStorage();

  String _title = "init";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSecureItem(SecureKeys.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveFloatinActionButton(),
          SizedBox(
            width: 30,
          ),
          _removeFloatinActionButton(),
        ],
      ),
      body: TextField(
        onChanged: _saveItem,
      ),
    );
  }

  void _saveItem(String data) {
    setState(() {
      _title = data;
    });
  }

  Future<void> _getSecureItem(SecureKeys key) async {
    _title = await _secureStorage.read(key: key.name) ?? "";
    setState(() {});
  }

  FloatingActionButton _saveFloatinActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        await _secureStorage.write(key: SecureKeys.token.name, value: _title);
      },
      child: Icon(Icons.save_alt_rounded),
    );
  }

  FloatingActionButton _removeFloatinActionButton() {
    return FloatingActionButton(
      onPressed: () async {},
      child: Icon(Icons.remove_circle_outline_rounded),
    );
  }
}

enum SecureKeys {
  token,
}
