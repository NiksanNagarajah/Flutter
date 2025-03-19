import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:td2/viewModel/setting_view_model.dart';
import 'package:td2/viewModel/task_view_model.dart';

import 'UI/home.dart';
import 'UI/mytheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) {
              SettingViewModel settingViewModel = SettingViewModel();
              return settingViewModel;
            }),
        ChangeNotifierProvider(
            create:(_){
              TaskViewModel taskViewModel = TaskViewModel();
              taskViewModel.generateTasks();
              return taskViewModel;
            }),
      ],
      child: Consumer<SettingViewModel>(
        builder: (context, SettingViewModel notifier, child) {
          return MaterialApp(
              theme: notifier.isDark ? MyTheme.dark() : MyTheme.light(),
              title: 'TD2',
              home: const Home());
        },
      ),
    );
  }
}
