import 'package:flutter/material.dart';
import 'package:refuge_govt/ui/screens/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://rzzdxjmkaxuntlgyfvee.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ6emR4am1rYXh1bnRsZ3lmdmVlIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NzkyMDIwMCwiZXhwIjoxOTkzNDk2MjAwfQ.ZMsBMjD2DKsIHe0MDdjOr6iNhfWZ34l3tHP3rUqLeHY',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.blue[50],
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          iconColor: Colors.blue[900],
          prefixIconColor: Colors.blue[900],
          suffixIconColor: Colors.blue[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: Home(),
    );
  }
}
