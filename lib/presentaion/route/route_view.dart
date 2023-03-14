import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/characters_repository.dart';

import '../../data/web_services/character_webservice.dart';
import '../../logicBusiness/cubits/characters_cubit.dart';
import '../../main.dart';
import '../screens/character_screen.dart';

class Routes {
  static const String myApp = "/";
  static const String characterDetailsScreen = "/login";
  static const String homeView = "/homeView";
  static const String signUpRoute = "/signUpRoute";
  static const String logOutRoute = "/LogOutRoute";
  static const String ThemeRoute = "/ThemeRoute";
}

class RouteGenerator {
  // late CharactersRepository charactersRepository;
  // late CharactersCubit charactersCubit;
  // RouteGenerator() {
  //   charactersRepository = CharactersRepository(CharacterWebServices());
  //   charactersCubit = CharactersCubit(charactersRepository);
  // }
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.myApp:
        return MaterialPageRoute(builder: (_) => const MyApp());
      case Routes.characterDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) => CharactersCubit(
                    CharactersRepository(CharacterWebServices())),
                child: CharactersScreen()));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No Route found"),
              ),
              body: const Center(
                child: Text("No Route found"),
              ),
            ));
  }
}
