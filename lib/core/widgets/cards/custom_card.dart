import 'package:flutter/material.dart';
import 'package:notesphere/core/colors_themes/colors.dart';
import 'package:notesphere/core/colors_themes/shadows.dart';
import 'package:notesphere/core/colors_themes/text_style.dart';
import 'package:notesphere/core/extensions/context_extension.dart';
import 'package:notesphere/core/extensions/widget_extensions.dart';

class CustomCard extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? color;
  final bool hasShadow;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? margin;
  final String title, subtitle;

  const CustomCard({
    super.key,
    this.padding,
    this.onTap,
    this.color,
    this.hasShadow = true,
    this.onLongPress,
    this.margin,
    this.title = 'Note Title',
    this.subtitle = 'Note discription',
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.theme.brightness == Brightness.dark;

    return Material(
      color: Colors.transparent,
      child:
          Container(
                padding: padding ?? EdgeInsets.all(16),
                height: MediaQuery.sizeOf(context).height * 0.17,
                width: 400,
                margin: margin,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, maxLines: 1, style: AppTextStyles.headingLarge),
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodyLarge,
                    ),
                  ],
                ),
              )
              .inkWell(onTap: onTap ?? () {})
              .decorated(
                boxShadow: AppShadows.card(isDark),

                color: isDark ? AppColors.darkSurface : AppColors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  width: 1,
                ),
              ),
    );
  }
}
