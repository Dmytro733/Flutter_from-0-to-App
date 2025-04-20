import 'package:flutter/material.dart';
import 'package:flutter_secound_app/features/auth/view/login_screen.dart';
import 'package:flutter_secound_app/features/find_your_teacher/view/find_your_teacher_screen.dart';
import 'package:flutter_secound_app/features/home/view/home_screen.dart';
import 'package:flutter_secound_app/features/profile/view/profile_screen.dart';
import 'package:flutter_secound_app/data/notifiers.dart';
import 'package:flutter_secound_app/widgets/navbar_widget.dart';

List<Widget> pages = [
  HomePage(),
  AuthPage(),
  FindYourTeacherPage(),
  ProfilePage()
];

class TreeWidget extends StatelessWidget {
  const TreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter map'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              isDarkNotifier.value = !isDarkNotifier.value;
            }, 
            icon: ValueListenableBuilder(
              valueListenable: isDarkNotifier,
              builder: (context, isDarkMode, child) {
                return Icon(isDarkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded);
              }
            )
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier, 
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        }
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}