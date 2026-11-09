import 'package:counter_app/bloc/counter/counter_bloc.dart';
import 'package:counter_app/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:counter_app/bloc/image_picker/image_picker_bloc.dart';
import 'package:counter_app/bloc/switch/switch_bloc.dart';
import 'package:counter_app/bloc/to_do_app/to_do_bloc.dart';
import 'package:counter_app/repository/favourite_repositroy.dart';
import 'package:counter_app/repository/login/login_http_repository.dart';
import 'package:counter_app/repository/login/login_repository.dart';
import 'package:counter_app/ui/login/login_screen.dart';
import 'package:counter_app/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'repository/post_repositroy.dart';
import 'bloc/post/post_bloc.dart';

GetIt getIt = GetIt.instance;
void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => ToDoBloc()),
        BlocProvider(create: (_) => FavouriteAppBloc(FavouriteRepositroy())),
        BlocProvider(create: (_) => PostBloc(PostRepositroy())),
      ],
      child: MaterialApp(theme: ThemeData.light(), home: LoginScreen()),
    );
  }
}

void serviceLocator() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginHttpRepository());
}
