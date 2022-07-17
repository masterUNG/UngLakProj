import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unglakproj/bodys/get_api.dart';
import 'package:unglakproj/bodys/get_firebase.dart';
import 'package:unglakproj/utility/my_constant.dart';
import 'package:unglakproj/utility/my_dialog.dart';
import 'package:unglakproj/widgets/show_icon_button.dart';
import 'package:unglakproj/widgets/show_text.dart';

class MyService extends StatefulWidget {
  const MyService({Key? key}) : super(key: key);

  @override
  State<MyService> createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  var bodys = <Widget>[];
  var titles = <String>[
    'API',
    'Firebase',
  ];
  var iconDatas = <IconData>[
    Icons.network_check,
    Icons.fire_hydrant,
  ];
  int indexBody = 0;

  var bottonNavigationBarItems = <BottomNavigationBarItem>[];

  String? uidLogin;

  @override
  void initState() {
    super.initState();

    createBottonNavigate();
    findUidLogin();
  }

  Future<void> findUidLogin() async {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      uidLogin = event!.uid;

      bodys.add(const GetApi());
      bodys.add(GetFirebase(uidLogin: uidLogin!,));

      setState(() {});
    });
  }

  void createBottonNavigate() {
    for (var i = 0; i < titles.length; i++) {
      bottonNavigationBarItems.add(
        BottomNavigationBarItem(
          label: titles[i],
          icon: Icon(
            iconDatas[i],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: newAppBar(context),
      body: bodys[indexBody],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: MyConstant.primary,
        onTap: (value) {
          setState(() {
            indexBody = value;
          });
        },
        currentIndex: indexBody,
        items: bottonNavigationBarItems,
      ),
    );
  }

  AppBar newAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: ShowText(
        text: titles[indexBody],
        textStyle: MyConstant().h2Style(),
      ),
      actions: [
        ShowIconButton(
          iconData: Icons.exit_to_app,
          pressFunc: () {
            MyDialog(context: context).normalDialog(
                label2: 'SignOut',
                pressFunc2: () {
                  processSignOut(context: context);
                },
                title: 'Sign Out ?',
                subTitle: 'Please Confirm SignOut by Tap SignOut');
          },
        ),
      ],
      elevation: 0,
      foregroundColor: MyConstant.dark,
      backgroundColor: Colors.white,
    );
  }

  Future<void> processSignOut({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushNamedAndRemoveUntil(context, '/authen', (route) => false);
    });
  }
}
