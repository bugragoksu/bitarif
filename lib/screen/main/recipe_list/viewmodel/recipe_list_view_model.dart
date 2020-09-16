import 'package:bitarif/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'recipe_list_view_model.g.dart';

class RecipeListViewModel = _RecipeListViewModelBase with _$RecipeListViewModel;

abstract class _RecipeListViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
