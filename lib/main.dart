import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(platform: TargetPlatform.iOS),
      darkTheme: ThemeData.dark().copyWith(platform: TargetPlatform.iOS),
      title: 'BottomSheet Modals',
      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('Open'),
              onPressed: () => Navigator.of(context).push(
                MaterialWithModalsPageRoute(
                  builder: (context) => const SecondPage(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showCupertinoModalBottomSheet(
                  expand: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const BottomSheet(),
                );
              },
              child: const Text("Dialog"),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoButton(
          child: const Icon(
            CupertinoIcons.share,
            size: 28,
          ),
          onPressed: () {
            showCupertinoModalBottomSheet(
              expand: true,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const BottomSheet(),
            );
          },
        ),
      ),
    );
  }
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Scaffold(
        backgroundColor: CupertinoTheme.of(context).scaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Container(
              width: 60,
              margin: const EdgeInsets.symmetric(vertical: 12),
              height: 8,
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(25)),
            ),
            ...List.generate(10, (index) {
              return ListTile(
                title: Text("Item $index"),
              );
            }),
          ],
        ),
      ),
    );
  }
}
