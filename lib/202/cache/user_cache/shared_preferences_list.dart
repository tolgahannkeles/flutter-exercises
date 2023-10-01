import 'package:exercise/202/cache/shared_manager.dart';
import 'package:exercise/202/cache/user_cache/user_cache_manager.dart';
import 'package:exercise/202/cache/user_cache/user_model.dart';
import 'package:flutter/material.dart';

class SharedPreferencesListExercise extends StatefulWidget {
  const SharedPreferencesListExercise({super.key});

  @override
  State<SharedPreferencesListExercise> createState() =>
      _SharedPreferencesListExerciseState();
}

class _SharedPreferencesListExerciseState extends State<SharedPreferencesListExercise> {
  bool _isLoading = false;

  List<User> users = [];

  late final UserCacheManager _userCacheManager;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeShared();
  }

  Future<void> initializeShared() async {
    _changeLoading();
    final SharedManager sharedManager = SharedManager();
    await sharedManager.init();

    _userCacheManager = UserCacheManager(sharedManager);

    users = _userCacheManager.getUsers() ?? [];
    _changeLoading();
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);

    if (_value != null) {
      setState(() {});
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
            SizedBox(
              width: 30,
            ),
            _removeFloatinActionButton(),
          ],
        ),
        appBar: AppBar(
          actions: [
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox()
          ],
        ),
        body: Column(
          children: [
            Text("sa"),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _userCard(index);
                },
              ),
            ),
          ],
        ));
  }

  Card _userCard(int index) {
    return Card(
      color: Colors.amberAccent.shade100,
      child: ListTile(
        title: Text(users[index].name ?? "name"),
        subtitle: Text(users[index].description ?? "desc"),
        trailing: Text(
          users[index].url ?? "url",
          style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
        ),
      ),
    );
  }

  FloatingActionButton _saveFloatinActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        _changeLoading();
        await _userCacheManager.saveItems(users);
        _changeLoading();
      },
      child: Icon(Icons.save_alt_rounded),
    );
  }

  FloatingActionButton _removeFloatinActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        _changeLoading();
        _changeLoading();
      },
      child: Icon(Icons.remove_circle_outline_rounded),
    );
  }
}

class UserDummies {
  late final List<User> users;
  UserDummies() {
    users = [
      User(name: "Tolga", description: "Tolga Desc.", url: "hilgatek.dex"),
      User(name: "Tolga2", description: "Tolga2 Desc.", url: "hilgatek.dex"),
      User(name: "Tolga3", description: "Tolga3 Desc.", url: "hilgatek.dex"),
      User(name: "Tolga4", description: "Tolga4 Desc.", url: "hilgatek.dex"),
    ];
  }
}
