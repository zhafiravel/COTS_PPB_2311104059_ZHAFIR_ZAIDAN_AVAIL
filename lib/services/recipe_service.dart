import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../models/recipe_model.dart';

class RecipeService {
  static Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(
      Uri.parse('${ApiConfig.baseUrl}/recipes?select=*'),
      headers: {
        'apikey': ApiConfig.apiKey,
        'Authorization': 'Bearer ${ApiConfig.apiKey}',
      },
    );

    final List data = jsonDecode(response.body);
    return data.map((e) => Recipe.fromJson(e)).toList();
  }

  static Future<void> addRecipe(Map<String, dynamic> body) async {
    await http.post(
      Uri.parse('${ApiConfig.baseUrl}/recipes'),
      headers: {
        'apikey': ApiConfig.apiKey,
        'Authorization': 'Bearer ${ApiConfig.apiKey}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
  }

  static Future<void> updateRecipe({
    required int id,
    required Map<String, dynamic> body,
  }) async {
    await http.patch(
      Uri.parse('${ApiConfig.baseUrl}/recipes?id=eq.$id'),
      headers: {
        'apikey': ApiConfig.apiKey,
        'Authorization': 'Bearer ${ApiConfig.apiKey}',
        'Content-Type': 'application/json',
        'Prefer': 'return=representation',
      },
      body: jsonEncode(body),
    );
  }
}
