import 'package:flutter/material.dart';
import 'package:mybank_app/constans/styles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Padding(
        padding: Styles.eiHorizontal20Vertical10,
        child: Column(
          children: [Text('data')],
        ),
      ),
    );
  }
}
