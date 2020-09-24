import 'package:bitarif/core/constants/enums/http_types_enum.dart';
import 'package:bitarif/core/constants/server/server_constants.dart';
import 'package:bitarif/core/extensions/context_extension.dart';
import 'package:bitarif/core/utils/widget_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_view_model.dart';
import '../../../recipe/recipe_detail.dart/model/recipe_model.dart';

part 'search_view_model.g.dart';

class SearchViewModel = _SearchViewModelBase with _$SearchViewModel;

abstract class _SearchViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}

  @observable
  bool isLoading = false;

  @observable
  List<Category> categoryList;

  @action
  Future<List<Category>> getCategoryList({String token}) async {
    try {
      isLoading = true;
      final result = await this.coreDio.fetch<List<Category>, Category>(
          ServerConstants.CATEGORY_LIST_ENDPOINT,
          token: token,
          parseModel: Category(),
          type: HttpTypes.GET);
      if (result.data is List<Category>) {
        categoryList = result.data;
      } else {
        this.context.showSnackBar(
            WidgetUtils.instance.buildSnackBar(context, result.error.message));
      }
      return categoryList;
    } catch (e) {
      this.context.showSnackBar(
          WidgetUtils.instance.buildSnackBar(context, "somethingWentWrong"));
      return [];
    } finally {
      isLoading = false;
    }
  }
}
