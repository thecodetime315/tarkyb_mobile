import 'package:flutter/material.dart';

import '../resource/color_manager.dart';
import 'my_text.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget> actions;
  final double? size ;

  DefaultAppBar({
    required this.title,
    this.actions = const [],
    this.leading,
    this.size
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: MyText(
        title: "$title",
        size: 12,
        color: ColorManager.white,
      ),
      centerTitle: false,
      backgroundColor: ColorManager.primary,
      elevation: 0,
      leading: leading ??
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: ColorManager.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(size??65);
}
