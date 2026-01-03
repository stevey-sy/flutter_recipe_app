import 'package:flutter_recipe_app/domain/data_source/local_storage.dart';

class DefaultLocalStorageImpl implements LocalStorage {
  var _data = <String, dynamic>{};

  @override
  Future<void> save(Map<String, dynamic> json) async {
    _data = json;
  }

  @override
  Future<Map<String, dynamic>> load() async {
    return _data;
  }
}
