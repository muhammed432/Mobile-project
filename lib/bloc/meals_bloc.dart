import 'package:observable/observable.dart';
import 'package:rxdart/subjects.dart';

import '../resources/repository.dart';
import '../model/item_model.dart';

class MealsBloc {
  final _repository = Repository();
  final _mealsFetcher = PublishSubject<ItemModel>();

  Stream<ItemModel> get allMeals => _mealsFetcher.stream;

  fetchDessert() async {
    ItemModel itemModel = await _repository.fetchAllMeals("Dessert");
    _mealsFetcher.sink.add(itemModel);
  }

  fetchSeafood() async {
    ItemModel itemModel = await _repository.fetchAllMeals("Seafood");
    _mealsFetcher.sink.add(itemModel);
  }

  dispose() {
    _mealsFetcher.close();
  }
}
