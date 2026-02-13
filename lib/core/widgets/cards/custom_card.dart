import 'package:flutter/material.dart';
import 'package:notesphere/core/extensions/context_extension.dart';
import 'package:notesphere/core/extensions/widget_extensions.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? color;
  final bool hasShadow;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? margin;

  const CustomCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.color,
    this.hasShadow = true,
    this.onLongPress,
    this.margin,
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
                child: child,
              )
              .inkWell(onTap: onTap ?? () {})
              .decorated(
                boxShadow: [
                  BoxShadow(color: Colors.black45, offset: Offset(0.4, 0.5)),
                ],
                color: color ?? context.theme.cardColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isDark
                      ? const Color(0xFF404040)
                      : const Color(0xFFE5E5E5),
                  width: 1,
                ),
              ),
    );
  }
}
