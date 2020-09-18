import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/base/widget/base_widget.dart';
import '../../../../core/components/card/stack_image_card.dart';
import '../../../../core/components/text/locale_text.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/double_extension.dart';
import '../../../_widgets/colored_gradient_divider.dart';
import '../viewmodel/favourite_view_model.dart';

class FavouriteView extends StatefulWidget {
  FavouriteView({Key key}) : super(key: key);
  @override
  _FavouriteViewState createState() => _FavouriteViewState();
}

class _FavouriteViewState extends BaseState<FavouriteView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<FavouriteViewModel>(
      viewModel: FavouriteViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, FavouriteViewModel value) =>
          _buildScaffold,
    );
  }

  Widget get _buildScaffold => BaseWidget(
        children: [
          ..._buildFavTitle,
          context.normalValue.toHeightSizedBox,
          ListView.builder(
            shrinkWrap: true,
            itemExtent: context.height / 10,
            itemCount: 6,
            itemBuilder: (_, index) => Column(
              children: [
                _buildRecipeTile(
                    onTap: () {},
                    title: 'Coconut Curry $index',
                    url:
                        "https://shemins.scdn2.secure.raxcdn.com/wp-content/uploads/2018/02/Shemins-Lucknowi-Biryani.jpg"),
                Divider()
              ],
            ),
          ),
        ],
      );

  Widget _buildRecipeTile({String title, String url, VoidCallback onTap}) =>
      ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.all(0),
        trailing: IconButton(
          icon: Icon(FeatherIcons.arrowRight),
          onPressed: onTap,
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
        leading: StackImageCard(
          width: context.width / 6,
          isNetwork: true,
          path: url,
          child: null,
        ),
      );
  List<Widget> get _buildFavTitle => [
        LocaleText(
            value: "favList",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: context.mediumValue)),
        context.lowValue.toHeightSizedBox,
        ColoredGradientDivider()
      ];
}
