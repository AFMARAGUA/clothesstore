import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Search {
  static Widget textFormField({
    TextInputType keyboardType = TextInputType.name,
    bool obscureText = false,
    InputDecoration decoration = const InputDecoration(),
    TextAlign textAlign = TextAlign.start,
    TextStyle style,
    bool autofocus = false,
    Function(String) onChanged,
    String Function(String) validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    String initialValue,
    Function(String) onFieldSubmitted,
    TextInputAction textInputAction = TextInputAction.done,
    FocusNode focusNode,
    int maxLength,
    List<TextInputFormatter> inputFormatters,
    int maxLines = 1,
    bool enabled,
    bool readOnly = false,
    TextEditingController controller,
    void Function() onTap,
  }) {
    return TextFormField(
      onTap: () => onTap != null ? onTap() : null,
      enabled: enabled,
      controller: controller,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      textAlign: textAlign,
      maxLength: maxLength,
      maxLines: maxLines,
      focusNode: focusNode ?? null,
      initialValue: controller == null ? initialValue : null,
      autofocus: autofocus,
      autovalidateMode: autovalidateMode,
      decoration: decoration,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      style: style,
      onChanged: (text) => onChanged != null ? onChanged(text) : null,
      validator: (value) => validator != null ? validator(value) : null,
      onFieldSubmitted: (text) =>
          onFieldSubmitted != null ? onFieldSubmitted(text) : null,
    );
  }
}
