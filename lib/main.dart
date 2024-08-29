import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmortyapp/models/character_model.dart';
import 'package:rickandmortyapp/providers/api_provider.dart';
import 'package:rickandmortyapp/screens/character_screen.dart';
import 'package:rickandmortyapp/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

final GoRouter _router = GoRouter(
    routes: [ 
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomeScreen();
        },
        routes:[
          GoRoute(
            path:'character',
            builder:(context,state){
              final character=state.extra as Character;
              return CharacterScreen(
                character: character,
              );
            },
          )
        ]
        
        )

]);

class MainApp extends StatelessWidget {
  const MainApp({super.key});



  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create:(context)=>ApiProvider(),
      child: MaterialApp.router(
      title: 'Rick & Morty APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true
      ),
      routerConfig: _router,
    ),
    );
  }
}
