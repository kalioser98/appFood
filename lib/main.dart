import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodloop/States/favorites_list_state.dart';
import 'package:foodloop/Views/screens/authentication/Welcome.dart';
import 'package:foodloop/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  FirebaseFirestore.instance.clearPersistence();
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FavoritesListState())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'inter',
          scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        home: WelcomePage(),
      ),
    );
  }
}
