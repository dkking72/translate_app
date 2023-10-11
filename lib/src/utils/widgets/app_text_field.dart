import 'package:translate_app/src_exports.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.validator,
    this.controller,
    this.readOnly = false,
    this.textInputType,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.hintTextStyle,
    this.inputFormatters,
    this.onChanged,
  });

  final FormFieldValidator? validator;
  final TextEditingController? controller;
  final bool readOnly;
  final TextInputType? textInputType;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextStyle? hintTextStyle;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      readOnly: readOnly,
      obscureText: obscureText,
      onChanged: onChanged,
      style: const TextStyle(color: AppColors.whiteClr),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintTextStyle ?? const TextStyle(color: AppColors.whiteClr),
        suffixIcon: suffixIcon?.marginSymmetric(horizontal: 6.0),
        prefixIcon: prefixIcon?.marginSymmetric(horizontal: 6.0),
        fillColor: AppColors.textBoxColor,
        filled: true,
        disabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        errorBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
