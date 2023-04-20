import 'package:hive/hive.dart';
part 'hive_recipe.g.dart';

@HiveType(typeId: 0)
class HiveRecipe extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? image;
  @HiveField(3)
  num? rating;
  @HiveField(4)
  List<dynamic>? ingredients;
  @HiveField(5)
  List<dynamic>? instructions;

  HiveRecipe(
      {this.id,
      this.name,
      this.image,
      this.rating,
      this.ingredients,
      required instructions});

  factory HiveRecipe.fromJson(Map<String, dynamic> json) {
    return HiveRecipe(
      id: json["id"],
      name: json['name'],
      image: json['thumbnail_url'],
      rating: json['user_ratings']?['score'] ?? 0,
      ingredients: json["sections"],
      instructions: json["instructions"],
    );
  }
}
