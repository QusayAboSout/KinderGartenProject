import 'package:frontend/core/services/mpdb.dart';
import 'package:frontend/core/services/tools.dart';
import 'package:frontend/model/auth.dart';
import 'package:sqflite/sqflite.dart';

class AuthReposetory {
  Future<int> insertData(Auth data) async {
    if (Tools.isWeb()) {
      // return await addToLocalStorage(data);
      return 0;
    } else {
      Database db = await Mpdb.database;
      await deleteAuth();
      return await db.insert('Auth', data.toJson());
    }
  }

  Future deleteAuth() async {
    Database db = await Mpdb.database;
    await db.execute('delete from Auth');
  }

  Future<Auth?> getAuth() async {
    if (Tools.isWeb()) {
      // return await getFromLocalStorage();
    }
    Database db = await Mpdb.database;
    var resultMap = await db.query('Auth');
    List<Auth> list = [];
    for (var element in resultMap) {
      var auth = Auth.fromJson(element);
      list.add(auth);
    }
    if (list.isEmpty) return null;
    return list.first;
  }
}
