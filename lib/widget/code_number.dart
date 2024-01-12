import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CodeNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  //final void Function(String value) onChange;
  const CodeNumber({
    super.key,
    required TextEditingController textEditingController,
    required FocusNode focusNode,
    //required Function(String value) onChange,
  }) : textEditingController = textEditingController,
        focusNode = focusNode;
        //onChange = onChange ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: SingleChildScrollView(
        child: Container(
          width: 348,
          height: 60,
          child: Card(
            elevation: 10,
            shadowColor:Color(0xFFEFEFEF),
            child: TextFormField(
              onSaved: (pin1){},
              onChanged: (value){
                if(value.length == 1){
                  FocusScope.of(context).nextFocus();
                }
              },
              controller: textEditingController,
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFEFEFEF),
                //enabledBorder: InputBorder.none,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Color(0xFFEFEFEF),
                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: Colors.transparent
                  ),
                )
              ),
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ),
      ),
    );
  }
}