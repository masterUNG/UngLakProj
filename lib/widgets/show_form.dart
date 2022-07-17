// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:unglakproj/utility/my_constant.dart';

class ShowForm extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final Function(String) changeFunc;
  final bool? obsecu;
  final Function()? redEyeFunc;
  final TextInputType? textInputType;
  const ShowForm({
    Key? key,
    required this.hint,
    required this.iconData,
    required this.changeFunc,
    this.obsecu,
    this.redEyeFunc,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(top: 16),
      child: TextFormField(
        keyboardType: textInputType ?? TextInputType.text,
        obscureText: obsecu ?? false,
        onChanged: changeFunc,
        style: MyConstant().h3Style(),
        decoration: InputDecoration(
          fillColor: Colors.white.withOpacity(0.5),
          filled: true,
          contentPadding: const EdgeInsets.only(top: 4, bottom: 4, left: 12),
          suffixIcon: redEyeFunc == null
              ? Icon(
                  iconData,
                  color: MyConstant.dark,
                )
              : IconButton(
                  onPressed: redEyeFunc,
                  icon: Icon(
                    obsecu!
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye,
                    color: MyConstant.active,
                  ),
                ),
          hintStyle: MyConstant().h3lightStyle(),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: MyConstant.dark),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: MyConstant.ligh),
          ),
        ),
      ),
    );
  }
}
