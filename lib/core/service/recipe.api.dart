import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import '../../models/hive_recipe.dart';
import '../constants/constants.dart';
import 'package:http/http.dart' as http;

final dio = Dio();

// void getHttp() async {
//   final response = await dio.get('https://dart.dev');
//   print(response);
// }
class RecipeApi {
  static final recipesBox = Hive.box('recipes');
  // static List<HiveRecipe> getRecipes() {
  //   return [
  //     HiveRecipe(id: 1, name: "My1", image: "", rating: 5, ingredients: []),
  //     HiveRecipe(id: 2, name: "My2", image: "", rating: 4, ingredients: []),
  //     HiveRecipe(id: 3, name: "My3", image: "", rating: 4.5, ingredients: []),
  //   ];
  // }
  static Future<List<HiveRecipe>> getRecipes() async {
    // final response = await dio.get(
    //   "https://tasty.p.rapidapi.com/recipes/list",
    // );
    try {
      // final response = await dio.get(Constants.baseUrl, queryParameters: {
      final response = await http.get(Uri.parse(Constants.baseUrl), headers: {
        "X-RapidAPI-Key": Constants.apiKey,
        // "language": "en-us",
        "X-RapidAPI-Host": Constants.apiHost
      });
      final data = jsonDecode(response.body);
      List<HiveRecipe> temp = [];
      for (var i = 0; i < data['results'].length; i++) {
        final entry = data['results'][i];
        temp.add(HiveRecipe.fromJson(entry));
        recipesBox.put(i, HiveRecipe.fromJson(entry));
      }

      return temp;
    } catch (_) {
      print(_.toString());
      return [];
    }
  }
}
