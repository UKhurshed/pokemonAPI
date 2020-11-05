import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon/model/search_by_name_pokemon.dart';

abstract class SearchPokemonRepository{
  Future<Pokemon> getPokemon(String query);
}

class SearchPokemonRepositoryImpl implements SearchPokemonRepository{
  final BASE_URL = 'https://pokeapi.co/api/v2/';

  @override
  Future<Pokemon> getPokemon(String query) async{
    Pokemon pokemon;
    try{
      final http.Response response = await http.get('$BASE_URL/pokemon/$query');
      if(response.statusCode == 200){
        print('Response Data: ${response.body}');
        pokemon = Pokemon.fromJson(jsonDecode(response.body));
      }
      return pokemon;

    }catch(error){
      print('Error: $error');
      throw Exception(error);
    }
  }

}