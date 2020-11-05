import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:pokemon/simple_bloc_observer.dart';
import 'app.dart';

void main() async{
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}
