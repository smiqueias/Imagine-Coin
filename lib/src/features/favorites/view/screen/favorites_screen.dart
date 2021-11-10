import 'package:cryptocurrency_app/src/core/app_text_styles.dart';
import 'package:cryptocurrency_app/src/features/favorites/view-model/favorites_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<IFavoritesVM>(
      builder: (context, favorites, child) {
        return favorites.favorites.isEmpty
            ? Center(
                child: Text(
                "Ainda não há moedas favoritadas",
                style: AppTextStyles.heading18,
              ))
            : ListView.builder(
                itemCount: favorites.favorites.length,
                itemBuilder: (context, index) {
                  return Center(child: Text(favorites.favorites[index].name));
                },
              );
      },
    );
  }
}
