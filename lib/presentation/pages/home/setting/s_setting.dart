import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module/domain/entity/export.dart';
import 'package:module/presentation/bloc/auth/authentication.bloc.dart';
import 'package:module/shared/shared.export.dart';

part 'w_profile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Column(
        children: [
          ProfileWidget(),
          Spacer(flex: 3),
          ElevatedButton(
              onPressed: () {
                // TODO : 회원탈퇴 페이지로
              },
              child: Text("회원탈퇴")),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
