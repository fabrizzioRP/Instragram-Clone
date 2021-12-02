import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
import 'src/screen/main_insta_screen.dart';
import 'package:instagram_clone_app/src/provider/providers.dart';

void main() => runApp(AppState());

// ignore: use_key_in_widget_constructors
class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => InteraccionInstaProvider()),
      ], child: MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stateMode =
        Provider.of<InteraccionInstaProvider>(context).currentTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Challenges App',
      home: MainInstagramDemo(),
      theme: stateMode,
    );
  }
}
