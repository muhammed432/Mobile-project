import 'package:flutter/material.dart';
import '../model/item_model.dart';
import '../animation/hero.dart';
import 'detail_screen.dart';

Widget buildList(AsyncSnapshot<ItemModel> snapshot, String type) =>
    GridView.builder(
      key: const Key('grid'),
      // ignore: unnecessary_null_comparison
      itemCount: snapshot == null ? 0 : snapshot.data!.meals?.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Card(
            key: Key("meals_${snapshot.data!.meals![index].idMeal}"),
            elevation: 5.0,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.all(10),
            child: GridTile(
              child: PhotoHero(
                tag: snapshot.data!.meals![index].strMeal,
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 777),
                        pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) =>
                            DetailScreen(
                          idMeal: snapshot.data!.meals![index].idMeal,
                          strMeal: snapshot.data!.meals![index].strMeal,
                          strMealThumb: snapshot.data!.meals![index].strMealThumb,
                          type: type,
                        ),
                      ));
                },
                photo: snapshot.data!.meals![index].strMealThumb,
              ),
            ),
          ),
        );
      },
    );
