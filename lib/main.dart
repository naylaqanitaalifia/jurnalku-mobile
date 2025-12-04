import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/screens/attitude_notes.dart';
import 'package:jurnalku_mobile/screens/progress.dart';
import 'package:jurnalku_mobile/screens/witness_request.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // await initializeDateFormatting('id_ID', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      // locale: const Locale('id', 'ID'),
      // supportedLocales: const [
      //   Locale('id', 'ID'),
      // ],
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],

      home: const AttitudeNotes(),
      // home: const Progress(),
      // home: const WitnessRequest(),
    );
  }
}
