import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';

part 'favourite_view_model.g.dart';

class FavouriteViewModel = _FavouriteViewModelBase with _$FavouriteViewModel;

abstract class _FavouriteViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
