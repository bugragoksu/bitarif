import '../../../../core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'new_recipe_view_model.g.dart';

class NewRecipeViewModel = _NewRecipeViewModelBase with _$NewRecipeViewModel;

abstract class _NewRecipeViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
