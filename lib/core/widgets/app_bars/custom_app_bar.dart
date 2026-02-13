import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  //app bar properties
  final double scrolledUnderElevation;
  final String? title;
  final String? subtitle;
  final List<Widget> actions;
  final bool showBackButton;
  final Color? backgroundColor, foregroundColor;
  final VoidCallback? onBackPressed;
  final double elevation;
  final bool centerTitle;
  final bool showShadow;
  final TextStyle? titleStyle;

  const CustomAppBar({
    super.key,
    this.scrolledUnderElevation = 6,
    this.title,
    this.subtitle,
    this.actions = const [],
    this.backgroundColor,
    this.foregroundColor,
    this.onBackPressed,
    this.elevation = 5,
    this.centerTitle = false,
    this.showShadow = false,
    this.titleStyle,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: scrolledUnderElevation,
      centerTitle: centerTitle,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            )
          : null,
      title: title == null ? null : Text(title!, style: titleStyle),
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      actions: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            shape: CircleBorder(),
          ),
          child: Icon(Icons.more_vert, size: 20),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
