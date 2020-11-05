import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/model/search_by_name_pokemon.dart';
import 'package:pokemon/search_cubit/search_pokemon_cubit.dart';
import 'package:pokemon/widgets/loading_widget.dart';
import 'package:transparent_image/transparent_image.dart';

class SearchPokemonScreen extends StatelessWidget {
  const SearchPokemonScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 50),
          alignment: Alignment.center,
          child: BlocBuilder<SearchPokemonCubit, SearchPokemonState>(
            builder: (context, state) {
              if (state is SearchPokemonInitial) {
                return buildInitialInput();
              } else if (state is SearchPokemonLoading) {
                return LoadingWidget();
              } else if (state is SearchPokemonLoaded) {
                return columnPokemonData(state.pokemon);
              } else {
                return buildInitialInput();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: InputField(),
    );
  }

  Widget statsItemRow(
      {Pokemon pokemon, int statNameIndex, int baseStateIndex}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(pokemon.stats[statNameIndex].stat.name,
          style: TextStyle(fontSize: 20),),
        Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(pokemon.stats[baseStateIndex].baseStat.toString(),
              style: TextStyle(fontSize: 20),)
        )
      ],
    );
  }

  Column columnPokemonData(Pokemon pokemon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InputField(),
        SizedBox(
          height: 20,
        ),
        Text(
          pokemon.name ?? '',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 10,
        ),
        ClipRRect(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: pokemon.sprites.frontDefault,
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.grey.shade200,
                elevation: 10,
                child: Column(
                  children: [
                    Text(
                      'Abilities',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Text(
                      pokemon.abilities[0].ability.name,
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    Text(pokemon.abilities[1].ability.name,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center),
                    SizedBox(height: 15),
                    Text('Types',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),),
                    Text(
                      pokemon.types[0].type.name,
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 30,),
            Container(
              width: 200,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.grey.shade200,
                elevation: 10,
                child: Column(
                  children: [
                    Text(
                      'Statistics',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    statsItemRow(
                        pokemon: pokemon, statNameIndex: 0, baseStateIndex: 0),
                    statsItemRow(
                        pokemon: pokemon, statNameIndex: 1, baseStateIndex: 1),
                    statsItemRow(
                        pokemon: pokemon, statNameIndex: 2, baseStateIndex: 2),
                    statsItemRow(
                        pokemon: pokemon, statNameIndex: 3, baseStateIndex: 3)
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class InputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitPokemonName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: 'Enter Pokemon name',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitPokemonName(BuildContext context, String pokemonName) {
    final searchPokemonCubit = context.bloc<SearchPokemonCubit>();
    searchPokemonCubit.getPokemon(pokemonName);
  }
}
