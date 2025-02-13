import 'package:clean_code_bloc/config/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? headingTitle;
  final TextStyle? headingTitleStyle;
  final FocusNode focusNode;
  final String hint;
  final bool obscureText;
  final bool? filled;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final bool isLabel;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final TextInputAction textInputAction;
  final int? mixLine;
  final String? Function(String?)? validator; // Added validator

  const CustomTextField({
    super.key,
    this.headingTitle,
    this.headingTitleStyle,
    required this.controller,
    required this.focusNode,
    required this.hint,
    required this.label,
    this.isLabel = true,
    this.obscureText = false,
    this.keyboardType,
    this.filled = false,
    this.prefixIcon,
    this.suffixIcon,
    this.mixLine = 1,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.next,
    this.validator, // Added validator
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(
      () {
        setState(() {
          _isFocused = widget.focusNode.hasFocus;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool hasText = widget.controller.text.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.headingTitle != null)
          Text(
            widget.headingTitle ?? '',
            style: widget.headingTitleStyle ??
                Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: AppColors.textColour),
          ),
        TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.blackCustom),
          textInputAction: widget.textInputAction,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            filled: widget.filled ?? false,
            fillColor: widget.filled == true ? AppColors.secondaryColor : Colors.transparent,
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            hintText: !_isFocused && !hasText ? widget.hint : null, // Show hint only when not focused and empty
            labelText:
                widget.isLabel && (_isFocused || hasText) ? widget.label : null, // Conditionally show label // Show label when focused or has text
            labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: _isFocused || hasText ? Theme.of(context).primaryColor : AppColors.blackCustom,
                ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 14.0,
            ), // Display error text if validation fails
            errorStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.errorColor), // Customize error text style
          ),
          onFieldSubmitted: widget.onFieldSubmitted,
          maxLines: widget.mixLine,
          validator: widget.validator,
          onChanged: widget.onChanged, // Attach validator function
        ),
      ],
    );
  }
}
