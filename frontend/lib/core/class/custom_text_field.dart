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
          style: const TextStyle(
              color: AppColors.LIGHT_TEXT,
              fontSize: 18,
              fontWeight: FontWeight.bold),
          cursorColor: AppColors.LIGHT_TEXT,
          decoration: InputDecoration(
            errorStyle: const TextStyle(color: AppColors.DANGER, fontSize: 15),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:
                      _hasError ? AppColors.DANGER : AppColors.CREMIZON,
                  width: 2.0),
              borderRadius: const BorderRadius.all(Radius.circular(22.3)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color:
                      _hasError ? AppColors.DANGER : AppColors.CREMIZON,
                  width: 2.0),
              borderRadius: const BorderRadius.all(Radius.circular(22.3)),
            ),
            label: Text(
              widget.label,
              style: const TextStyle(
                  color: AppColors.LIGHT_TEXT,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            focusColor: AppColors.LIGHT_TEXT,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: _hasError
                        ? AppColors.DANGER
                        : AppColors.CREMIZON,
                    width: 2.0),
                borderRadius: const BorderRadius.all(Radius.circular(22.3))),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.CREMIZON,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(22.3)),
            ),
            hintText: widget.hint,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              borderSide: BorderSide(
                color: AppColors.LIGHT_TEXT,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            hintStyle:
                const TextStyle(color: Color.fromARGB(91, 231, 234, 238)),
            prefixIcon: widget.formName == 'email'
                ? const Icon(
                    Icons.person,
                    color: AppColors.SECONDARY_COLOR,
                  )
                : widget.formName == 'password'
                    ? const Icon(
                        Icons.lock,
                        color: AppColors.SECONDARY_COLOR,
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
