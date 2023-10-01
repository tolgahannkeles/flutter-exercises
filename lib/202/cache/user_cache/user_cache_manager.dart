import 'dart:convert';

import 'package:exercise/202/cache/shared_manager.dart';
import 'package:exercise/202/cache/user_cache/shared_preferences_list.dart';
import 'package:exercise/202/cache/user_cache/user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  Future<void> saveItems(List<User> users) async {
    final List<String> encodedUsers = users.map((e) => jsonEncode(e.toJson())).toList();
    await sharedManager.saveStringItems(SharedKeys.users, encodedUsers);
  }

  List<User>? getUsers() {
    final encodedUsers = sharedManager.getStringList(SharedKeys.users);

    if (encodedUsers?.isNotEmpty ?? false) {
      return encodedUsers!.map((e) {
        final json = jsonDecode(e);
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }
        return User(name: "", description: "", url: "");
      }).toList();
    }

    return null;
  }
}
