import 'package:cryptocurrency_app/src/features/favorites/view/screen/favorites_screen.dart';
import 'package:flutter/material.dart';

class FavoritesContainer extends StatelessWidget {
  const FavoritesContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavoritesScreen(),
    );
  }
}
