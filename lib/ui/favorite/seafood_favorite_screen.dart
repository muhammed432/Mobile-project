import 'package:flutter/material.dart';

import '../../model/item_model.dart';
import 'build_list_favorite.dart';


class SeafoodFavoriteScreen extends StatefulWidget {
  @override
  _SeafoodFavoriteScreenState createState() => _SeafoodFavoriteScreenState();
}

class _SeafoodFavoriteScreenState extends State<SeafoodFavoriteScreen> {
  late Future<List<Meals>> _seafoodFavorite;


  @override
  Widget build(BuildContext context) {
   // ignore: avoid_unnecessary_containers
   return Container(
      child: FutureBuilder(
        initialData: <Meals>[],
        future: _seafoodFavorite,
        builder:
            (BuildContext context, AsyncSnapshot<List<Meals>> snapshot) {
          if (snapshot.hasError) {
           return Text(snapshot.error.toString());
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<Meals> favoriteFoods = snapshot.data!;
            if (favoriteFoods.isEmpty) {
              return const Center(
                child: Text(
                  "No Favorite Seafood Available",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return buildListFavorite(favoriteFoods, "seafood");
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