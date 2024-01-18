import 'package:flutter/material.dart';
import 'package:habit_tracker/database/habit_database.dart';
//import 'package:habit_tracker/theme/light_mode.dart';
import 'package:habit_tracker/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //initialise database
  await HabitDatabase.initialize();
  await HabitDatabase().saveFirstLaunchDate();
  runApp(
    MultiProvider(providers: [
      //habit provider
      ChangeNotifierProvider(
        create: (context) => HabitDatabase()
      ),

      //theme provider
      ChangeNotifierProvider(
          create: (context)=> ThemeProvider()),

    ],
    child: const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    ); //MaterialApp
  }
}