import 'package:flutter/material.dart';

import '../../model/item_model.dart';
import '../../resources/favorite_local_provider.dart';
import 'build_list_favorite.dart';


class DessertFavoriteScreen extends StatefulWidget {
  @override
  _DessertFavoriteScreenState createState() => _DessertFavoriteScreenState();
}

class _DessertFavoriteScreenState extends State<DessertFavoriteScreen> {
late Future<List<Meals>> dessertFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        initialData: <Meals>[],
        future: dessertFavorite,
        builder:
            (BuildContext context, AsyncSnapshot<List<Meals>> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Meals> favoriteFoods = snapshot.data!;
            if (favoriteFoods.isEmpty) {
              return Center(
                child: Text(
                  "No Favorite Dessert Available",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return buildListFavorite(favoriteFoods, "dessert");
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}