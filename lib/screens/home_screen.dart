import 'package:flutter/material.dart';
import 'package:flutter_school_app/widget/card_home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody);
  }

  get _buildBody {
    return Column(
      children: [
        CardHomeWidget(
          name: 'Khoeurt Sokhy',
          urlImage: 'assets/image/ken.png,png',
          isUrlNetwork: false,
        ),
      ],
    );
  }
}
