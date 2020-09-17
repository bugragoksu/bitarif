import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';

part 'category_list_view_model.g.dart';

class CategoryListViewModel = _CategoryListViewModelBase
    with _$CategoryListViewModel;

abstract class _CategoryListViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
