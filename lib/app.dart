import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/repository/search_repository.dart';
import 'package:pokemon/screens/random_pokemon_screen.dart';
import 'package:pokemon/screens/search_pokemon_screen.dart';
import 'package:pokemon/search_cubit/search_pokemon_cubit.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon',
      home: BlocProvider(
        create: (context) => SearchPokemonCubit(SearchPokemonRepositoryImpl()),
        child: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> pages = [
    SearchPokemonScreen(
      key: PageStorageKey('Search'),
    ),
    RandomPokemonScreen(
      key: PageStorageKey('Random'),
    )
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  int _currentIndex = 0;

  Widget _bottomNavigationBar(int currentIndex) => BottomNavigationBar(
          selectedItemColor: Colors.blue[600],
          unselectedItemColor: Colors.black,
          onTap: (int index) => setState(() => _currentIndex = index),
          currentIndex: currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.settings_backup_restore_sharp,), label: 'Random'),
          ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_currentIndex),
      body: PageStorage(
        child: pages[_currentIndex],
        bucket: bucket,
      ),
    );
  }
}
