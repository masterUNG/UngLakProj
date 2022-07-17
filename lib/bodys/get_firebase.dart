// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unglakproj/models/user_model.dart';
import 'package:unglakproj/utility/my_constant.dart';
import 'package:unglakproj/widgets/show_progress.dart';

import 'package:unglakproj/widgets/show_text.dart';

class GetFirebase extends StatefulWidget {
  final String uidLogin;
  const GetFirebase({
    Key? key,
    required this.uidLogin,
  }) : super(key: key);

  @override
  State<GetFirebase> createState() => _GetFirebaseState();
}

class _GetFirebaseState extends State<GetFirebase> {
  String? uidLogin;
  UserModel? userModel;

  @override
  void initState() {
    super.initState();
    uidLogin = widget.uidLogin;
    readDataFirebase();
  }

  Future<void> readDataFirebase() async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uidLogin)
        .get()
        .then((value) {
      userModel = UserModel.fromMap(value.data()!);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return userModel == null
        ? const ShowProgress()
        : LayoutBuilder(builder: (context, constants) {
            return ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: constants.maxWidth * 0.6,
                      child: Column(
                        children: [
                          Image.network(userModel!.pathImage),
                          ShowText(
                            text: userModel!.name,
                            textStyle: MyConstant().h2Style(),
                          ),
                          ShowText(text: userModel!.email, textStyle: MyConstant().h3ActiveStyle(),)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          });
  }
}
