import 'package:flutter/material.dart';

import '../../../core/components/container/animated_open_container.dart';
import '../../main/blog_detail/view/blog_view.dart';
import '../card/blog_card.dart';

class AnimatedBlogCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpenContainer(
      closeWidget: BlogCard(
        path:
            "https://www.abouttimemagazine.co.uk/wp-content/uploads/2016/01/10559937_941361799269538_2577068189735280194_n.jpg",
        title: "Manger",
        desc: "Confessions of a bad blogger",
      ),
      openWidget: BlogDetailView(),
    );
  }
}
