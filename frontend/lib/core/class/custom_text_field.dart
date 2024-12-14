import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/core/class/colors.dart';

class CustomTextField extends StatefulWidget {
  final bool isQ; // Flag to determine if it's a required field
  final String label;
  final String hint;
  final String formName;
  final TextInputType textInputType;
  final String? Function(String?)? validate;
  final List<TextInputFormatter>? inputFormat;
  final bool password;
  final double bottomMargin;
  final double? width;
  final double? height;
  final bool enabled;
  final bool readonly;
  final String? initalValue;
  final String? labelText;
  final TextEditingController? controller;
  final int? maxLength;
  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.formName,
    required this.textInputType,
    this.validate,
    this.inputFormat,
    this.isQ = false,
    this.password = false,
    this.bottomMargin = 0,
    this.width,
    this.height,
    this.enabled = true,
    this.initalValue,
    this.labelText,
    this.readonly = false,
    this.controller,
    this.maxLength,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      _hasError =
          !widget.isQ && widget.validate != null && widget.validate! == '';
    });
  }

  @override
  /////// Start
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.bottomMargin),
      width: widget.width ?? MediaQuery.of(context).size.width * 9 / 10.0,
      height: widget.height,
      child: Focus(
        onFocusChange: (hasFocus) {
          if (!hasFocus) {
            setState(() {
              _hasError = !widget.isQ &&
                  widget.validate != null &&
                  widget.validate != '';
            });
          }
        },
        child: FormBuilderTextField(
          controller: widget.controller,
          initialValue: widget.initalValue,
          validator: widget.isQ
              ? (value) {
                  if ((value == null || value.isEmpty)) {
                    return "يرجى عدم ترك الحقل فارغ";
                  }
                  return null;
                }
              : widget.validate,
          keyboardType: widget.textInputType,
          obscureText: widget.password,
          style: Theme.of(context).textTheme.bodyLarge,
          cursorColor: Theme.of(context).primaryColor,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).inputDecorationTheme.fillColor,
            errorStyle: const TextStyle(
              color: AppColors.DANGER,
              fontSize: 15,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: _hasError
                      ? AppColors.DANGER
                      : Theme.of(context).primaryColor,
                  width: 2.0),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: _hasError
                      ? AppColors.DANGER
                      : Theme.of(context).primaryColor,
                  width: 2.0),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            label: Text(
              widget.label,
              style: Theme.of(context).inputDecorationTheme.labelStyle,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: _hasError
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColor,
                  width: 2.0),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2.0,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            hintText: widget.hint,
            hintStyle: const TextStyle(
              color: Color.fromRGBO(231, 234, 238, 0.91),
            ),
            prefixIcon: widget.formName == 'email'
                ? Icon(
                    Icons.person,
                    color: Theme.of(context).iconTheme.color,
                  )
                : widget.formName == 'password'
                    ? Icon(
                        Icons.lock,
                        color: Theme.of(context).iconTheme.color,
                      )
                    : widget.formName == 'confirmPassword'
                        ? Icon(
                            Icons.lock,
                            color: Theme.of(context).iconTheme.color,
                          )
                        : null,
          ),
          name: widget.formName,
          inputFormatters: widget.inputFormat,
          enabled: widget.enabled,
          readOnly: widget.readonly,
          maxLength: widget.maxLength,
        ),
      ),
    );
  }
}
