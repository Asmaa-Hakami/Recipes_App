import 'dart:convert';
import 'package:hive/hive.dart';
import '../../models/hive_recipe.dart';
import '../constants/constants.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static final recipesBox = Hive.box('recipes');
  static Future<List<HiveRecipe>> getRecipes() async {
    try {
      final response = await http.get(
          Uri.https(Constants.baseUrl, "/recipes/list", Constants.param),
          headers: {
            "X-RapidAPI-Key": Constants.apiKey,
            "X-RapidAPI-Host": Constants.apiHost
          });
      final data = jsonDecode(response.body);
      List<HiveRecipe> temp = [];
      for (var i = 0; i < data['results'].length; i++) {
        final entry = data['results'][i];
        temp.add(HiveRecipe.fromJson(entry));
        temp[i].instructions!.length == 0
            ? []
            : recipesBox.put(i, HiveRecipe.fromJson(entry));
      }

      return temp;
    } catch (_) {
      print(_.toString());
      return [];
    }
  }
}
