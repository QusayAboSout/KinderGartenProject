import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:frontend/core/class/colors.dart';

class CustomFormBuilderTextField extends StatefulWidget {
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

  const CustomFormBuilderTextField({
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
  });

  @override
  _CustomFormBuilderTextFieldState createState() =>
      _CustomFormBuilderTextFieldState();
}

class _CustomFormBuilderTextFieldState
    extends State<CustomFormBuilderTextField> {
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
            fontWeight: FontWeight.bold,
          ),
          cursorColor: AppColors.LIGHT_TEXT,
          decoration: InputDecoration(
            labelText: widget.label,
            focusColor: AppColors.LIGHT_TEXT,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: _hasError ? Colors.black : AppColors.SECONDARY_COLOR,
                  width: 2.0),
              borderRadius: const BorderRadius.all(Radius.circular(22.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: _hasError ? Colors.black : AppColors.SECONDARY_COLOR,
                  width: 2.0),
              borderRadius: const BorderRadius.all(Radius.circular(22.3)),
            ),
            hintText: widget.hint,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            hintStyle:
                const TextStyle(color: Color.fromARGB(115, 229, 230, 232)),
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
        ),
      ),
    );
  }
}
