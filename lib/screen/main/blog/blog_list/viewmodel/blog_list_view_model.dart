import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_view_model.dart';

part 'blog_list_view_model.g.dart';

class BlogListViewModel = _BlogListViewModelBase with _$BlogListViewModel;

abstract class _BlogListViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
