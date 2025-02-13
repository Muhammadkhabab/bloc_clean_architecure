import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool isLoading;
  final String? label;
  final double width;
  final double height;
  final Gradient? gradient;
  final bool isIcon;
  final Widget? icon;
  final BorderRadiusGeometry? borderRadius;

  CustomButton({
    Key? key,
    required this.onPressed,
    this.label,
    this.borderRadius,
    required this.backgroundColor,
    required this.textColor,
    this.isLoading = false,
    required this.width,
    this.height = 50,
    this.isIcon = false,
    this.icon,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius ?? BorderRadius.circular(5.0), // Default to 5.0
          border: Border.all(color: backgroundColor, width: 1),
          gradient: gradient,
        ),
        child: isLoading
            ? const SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(color: Colors.white, strokeCap: StrokeCap.round),
              )
            : isIcon && icon != null
                ? icon
                : Text(
                    label ?? '',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(color: textColor),
                  ),
      ),
    );
  }
}
