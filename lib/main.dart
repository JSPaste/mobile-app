import 'package:flutter/material.dart';
import 'package:jspaste_mobile/components/button.dart';
import 'package:jspaste_mobile/components/code_editor.dart';
import 'package:jspaste_mobile/constants/logo_icons.dart';
import 'package:jspaste_mobile/components/settings.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber)),
      home: const Scaffold(
        body: CodeEditor(),
        bottomNavigationBar: JSPasteBottomBar(),
      ),
    );
  }
}

class JSPasteBottomBar extends StatelessWidget {
  const JSPasteBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          BottomAppBarButton(
              icon: LogoIcons.fullIcon,
              onTap: () {
                print("jspaste logo pressed");
              }),
          const SizedBox(width: 10),
          const Text('[Placeholder]'),
          const Spacer(),
          BottomAppBarButton(
              icon: Icons.settings,
              onTap: () {
                print("config pressed");

                showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    // make the shapeborder a radius of 10
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    builder: (context) {
                      return const SettingsMenu();
                    });
              }),
        ],
      ),
    );
  }
}
