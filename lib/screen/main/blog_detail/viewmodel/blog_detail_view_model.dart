import 'package:bitarif/core/base/model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'blog_detail_view_model.g.dart';

class BlogDetailViewModel = _BlogDetailViewModelBase with _$BlogDetailViewModel;

abstract class _BlogDetailViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
