import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

class UserProvider extends ChangeNotifier {
  List<dynamic> users = [];
  //List posts = [];

  UserProvider() {
    loadData();
  }

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/user.json');
    Map dataMap = json.decode(resp);

    users = dataMap['users'];
    //this.posts.add(dataMap['users']['posts']);
    //print('imprimo desde loadData : ' + '${this.users}');
    notifyListeners();
    return users;
  }
}
