import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sosmed_emenu/ui/feed_screen.dart';
import 'package:sosmed_emenu/ui/main-page.dart';

void main() {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    runApp(MyApp());
} 

class MyApp extends StatelessWidget {
    // This widget is the root of your application.`
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Sosial Media',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blue,
            ),
            home: FeedScreen(),
        );
    }
}

