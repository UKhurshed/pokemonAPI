import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:pokemon/model/search_by_name_pokemon.dart';
Future<void> fetchPoke() async {
  final BASE_URL = 'https://pokeapi.co/api/v2/';
  try{
    Response response = await Dio().get('${BASE_URL}/pokemon/lapras');
    if(response.statusCode == 200){
      print('\n#######################################\n');
      print('Response Data: ${Pokemon.fromJson(response.data).abilities.last}');
      // print('${response.data}')
    }
  }catch(error){
    print('Error: $error');
  }
}

void main() async{
  print('Started');
  await fetchPoke();
}