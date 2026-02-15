import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onSuffixIconPressed;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool enabled;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Color? fillColor;
  final bool filled;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final double? borderRadius;
  final bool showCounter;
  final AutovalidateMode? autovalidateMode;
  final TextDirection? textDirection;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool enableIMEPersonalizedLearning;
  final String? initialValue;
  final void Function()? onEditingComplete;
  final ScrollPhysics? scrollPhysics;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.onSuffixIconPressed,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.enabled = true,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.contentPadding,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.fillColor,
    this.filled = false,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.borderRadius = 12,
    this.showCounter = true,
    this.autovalidateMode,
    this.textDirection,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.enableIMEPersonalizedLearning = true,
    this.initialValue,
    this.onEditingComplete,
    this.scrollPhysics,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color:
              widget.fillColor ??
              (widget.enabled ? Colors.white : Colors.grey.shade100),

          borderRadius: BorderRadius.circular(widget.borderRadius!),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextFormField(

          obscuringCharacter: '*',
          controller: widget.controller,
          initialValue: widget.initialValue,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          readOnly: widget.readOnly,
          maxLines: widget.obscureText ? 1 : widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.showCounter ? widget.maxLength : null,
          enabled: widget.enabled,
          focusNode: widget.focusNode,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          textCapitalization: widget.textCapitalization,
          textAlign: widget.textAlign,
          textDirection: widget.textDirection,
          enableSuggestions: widget.enableSuggestions,
          autocorrect: widget.autocorrect,
          enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
          onEditingComplete: widget.onEditingComplete,
          scrollPhysics: widget.scrollPhysics,

          autovalidateMode: widget.autovalidateMode,
          decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            helperText: widget.helperText,
            errorText: widget.errorText,
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon)
                : widget.prefix,
            suffixIcon: widget.suffixIcon != null
                ? IconButton(
                    icon: Icon(widget.suffixIcon),
                    onPressed: widget.onSuffixIconPressed,
                  )
                : widget.suffix,
            contentPadding:
                widget.contentPadding ??
                EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: widget.maxLines == 1 ? 14 : 18,
                ),
            border:
                widget.border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius!),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
            enabledBorder:
                widget.enabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius!),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
            focusedBorder:
                widget.focusedBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius!),
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
            errorBorder:
                widget.errorBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius!),
                  borderSide: const BorderSide(color: Colors.red),
                ),
            focusedErrorBorder:
                widget.focusedErrorBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius!),
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                ),
            fillColor:
                widget.fillColor ??
                (widget.enabled ? Colors.white : Colors.grey.shade100),
            filled: widget.filled,
            counterText: widget.showCounter ? null : '',
          ),
        ),
      ),
    );
  }
}
