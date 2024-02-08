import 'package:clone_instagram/constants/source_string.dart';
import 'package:clone_instagram/pages/dashboard_page.dart';
import 'package:clone_instagram/pages/profile/bloc/friend_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CloneInstagramApp extends StatelessWidget {
  const CloneInstagramApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FriendBloc(),
        )
      ],
      child: MaterialApp(
        title: SourceString.appName,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const DashboardPage(),
      ),
    );
  }
}