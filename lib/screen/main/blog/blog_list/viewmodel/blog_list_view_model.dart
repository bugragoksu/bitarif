import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_view_model.dart';
import '../../../../../core/constants/enums/http_types_enum.dart';
import '../../../../../core/constants/server/server_constants.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/utils/widget_utils.dart';
import '../../blog_detail/model/blog.dart';

part 'blog_list_view_model.g.dart';

class BlogListViewModel = _BlogListViewModelBase with _$BlogListViewModel;

abstract class _BlogListViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}

  @observable
  bool isLoading = false;

  @observable
  List<BlogPost> blogList;

  @action
  Future<List<BlogPost>> getBlogPosts({String token}) async {
    try {
      isLoading = true;
      final result = await this.coreDio.fetch<List<BlogPost>, BlogPost>(
          ServerConstants.BLOG_LIST_ENDPOINT,
          token: token,
          parseModel: BlogPost(),
          type: HttpTypes.GET);
      if (result.data is List<BlogPost>) {
        blogList = result.data;
      } else {
        this.context.showSnackBar(
            WidgetUtils.instance.buildSnackBar(context, result.error.message));
      }
      return blogList;
    } catch (e) {
      this.context.showSnackBar(
          WidgetUtils.instance.buildSnackBar(context, "somethingWentWrong"));
      return [];
    } finally {
      isLoading = false;
    }
  }
}
