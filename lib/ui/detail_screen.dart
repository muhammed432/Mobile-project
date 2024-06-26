import 'package:flutter/material.dart';

import '../bloc/detail_bloc.dart';
import '../model/item_model.dart';
import '../resources/favorite_local_provider.dart';

class DetailScreen extends StatefulWidget {
  final String? idMeal;
  final String? strMeal;
  final String? strMealThumb;
  final String? type;

  const DetailScreen({ this.idMeal,  this.strMeal, this.strMealThumb,  this.type});

  @override
  // ignore: library_private_types_in_public_api
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final bloc = DetailBloc();
  ItemModel? itemModel;
  bool _isFavorite = false;

  // @override
  // void initState() {
  //   super.initState();
  //   bloc.fetchDetailMeals(widget.idMeal ?? "");
  //    FavoriteLocalProvider.db.getFavoriteMealsById(widget.idMeal ?? "").then((value) {
  //     setState(() => _isFavorite = value != null);
  //   });
  // }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 250,
              floating: false,
              pinned: true,
              leading: IconButton(
                key: const Key('back'),
                icon: const Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              // actions: <Widget>[
              //  actionSaveorDelete()
              // ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  widget.strMeal ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                background: Hero(
              tag: widget.strMeal ?? "",
              child: Image.network(widget.strMealThumb ?? "",width: double.infinity,
                          fit: BoxFit.cover),
            ),
              ),
            ),
          ];
        },
        body: getDetailMeal(),
      ),
    );
  }

  getDetailMeal() {
    return StreamBuilder(
        stream: bloc.detailMeals,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            itemModel = snapshot.data;
            return _showListDetail(
                itemModel!);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue)));
        });
  }

  Widget _showListDetail(
     ItemModel itemModel) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: <Widget>[
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Deskripsi :",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      itemModel.meals![0].strInstructions.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget actionSaveorDelete(){
//   if (_isFavorite) {
//       return GestureDetector(
//         onTap: () {
//           FavoriteLocalProvider.db.deleteFavoriteMealsById(widget.idMeal ?? "").then((value) {
//             if (value > 0) {
//               setState(() => _isFavorite = false);
//             }
//           });
//          // showToast(context, "Remove from Favorite", duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
//         },
//         child: const Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Icon(Icons.favorite),
//         ),
//       );
//     } else {
//       return GestureDetector(
//         onTap: () {
//           Meals favoriteFood = Meals(
//             idMeal: widget.idMeal,
//             strMeal: widget.strMeal,
//             strMealThumb: widget.strMealThumb,
//             type: widget.type
//           );
//           FavoriteLocalProvider.db.addFavoriteMeals(favoriteFood).then((value) {
//             if (value > 0) {
//               setState(() => _isFavorite = true);
//             }
//           });
//           //showToast(context, "Add to Favorite", duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
//         },
//         child: const Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Icon(Icons.favorite_border),
//         ),
//       );
//     }
// }
// }

