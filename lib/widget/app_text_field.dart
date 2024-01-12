import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordfield;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType textInputType;
  final String? hint;
  final String? label;
  final String? helperText;
  final IconData? prefixIcon;
  final Color? color;
 // final bool is

  const AppTextField({
    super.key,
    this.textInputType=TextInputType.text,
     this.hint,
     this.prefixIcon,
    this.controller,
    this.fieldKey,
    this.isPasswordfield,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.label,
    this.helperText, this.color,

  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText= true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      controller:widget.controller ,
      key: widget.fieldKey,
      obscureText: widget.isPasswordfield == true ? _obscureText : false ,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Bahij_TheSansArabic-Black', color: widget.color),
      decoration: InputDecoration(
        hintText: widget.hint,
          hintStyle: TextStyle(
              fontFamily: 'Bahij_TheSansArabic-Black', fontSize: 14, fontWeight: FontWeight.w500, ),
          prefixIcon: Icon(widget.prefixIcon),
          suffixIcon: new GestureDetector(
            onTap: (){
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child:
            widget.isPasswordfield == true? Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: _obscureText == false ? Colors.blue : Colors.grey,) : Text(''),
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.grey
              )
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey
            ),
          )
      ),
    );
  }
}