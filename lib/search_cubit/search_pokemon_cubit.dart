import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon/model/search_by_name_pokemon.dart';
import 'package:pokemon/repository/search_repository.dart';

part 'search_pokemon_state.dart';

class SearchPokemonCubit extends Cubit<SearchPokemonState> {
  final SearchPokemonRepository _searchPokemonRepository;

  SearchPokemonCubit(this._searchPokemonRepository) : super(SearchPokemonInitial());

  Future<void> getPokemon(String pokemonName) async{
    try{
      emit(SearchPokemonLoading());
      final pokemon = await _searchPokemonRepository.getPokemon(pokemonName);
      emit(SearchPokemonLoaded(pokemon));
    }catch(error){
      print('Error: $error');
      emit(SearchPokemonError(error));
    }
  }

  Future<void> randomPokemon() async{
    final random = Random();
    //from 1 to 893
    var randomNum = random.nextInt(891) + 2;
    try{
      emit(SearchPokemonLoading());
      final pokemon = await _searchPokemonRepository.getPokemon(randomNum.toString());
      emit(SearchPokemonLoaded(pokemon));
    }catch(error){
      print('Error: $error');
      emit(SearchPokemonError(error));
    }
  }
}
