import 'package:exercise/202/cache/shared_manager.dart';
import 'package:flutter/material.dart';

class SharedPreferencesExercise extends StatefulWidget {
  const SharedPreferencesExercise({super.key});

  @override
  State<SharedPreferencesExercise> createState() => _SharedPreferencesExerciseState();
}

class _SharedPreferencesExerciseState extends State<SharedPreferencesExercise> {
  int _currentValue = 0;
  bool _isLoading = false;

  late final SharedManager _sharedManager;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sharedManager = SharedManager();

    _initialize();
  }

  Future<void> _initialize() async {
    _changeLoading();

    await _sharedManager.init();

    _changeLoading();

    _getDefaults();
  }

  Future<void> _getDefaults() async {
    _onChangeValue(await _sharedManager.getString(SharedKeys.counter) ?? "");
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);

    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveFloatinActionButton(),
          _removeFloatinActionButton(),
        ],
      ),
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox()
        ],
      ),
      body: TextField(
        onChanged: _onChangeValue,
      ),
    );
  }

  FloatingActionButton _saveFloatinActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        _changeLoading();
        await _sharedManager.saveString(SharedKeys.counter, _currentValue.toString());
        _changeLoading();
      },
      child: Icon(Icons.save_alt_rounded),
    );
  }

  FloatingActionButton _removeFloatinActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        _changeLoading();
        await _sharedManager.removeItem(SharedKeys.counter);
        _changeLoading();
      },
      child: Icon(Icons.remove_circle_outline_rounded),
    );
  }
}
