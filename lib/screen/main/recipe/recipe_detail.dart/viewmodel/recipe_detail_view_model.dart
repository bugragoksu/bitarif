import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_view_model.dart';

part 'recipe_detail_view_model.g.dart';

class RecipeDetailViewModel = _RecipeDetailViewModelBase
    with _$RecipeDetailViewModel;

abstract class _RecipeDetailViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
