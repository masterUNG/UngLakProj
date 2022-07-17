import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:unglakproj/models/food_model.dart';
import 'package:unglakproj/utility/my_constant.dart';
import 'package:unglakproj/utility/my_dialog.dart';
import 'package:unglakproj/widgets/show_progress.dart';
import 'package:unglakproj/widgets/show_text.dart';

class GetApi extends StatefulWidget {
  const GetApi({Key? key}) : super(key: key);

  @override
  State<GetApi> createState() => _GetApiState();
}

class _GetApiState extends State<GetApi> {
  var foodModels = <FoodModel>[];

  @override
  void initState() {
    super.initState();
    readAllAPI();
  }

  Future<void> readAllAPI() async {
    String path = 'https://www.androidthai.in.th/flutter/getAllFood.php';
    await Dio().get(path).then((value) {
      print('value from API ==> $value');

      var result = json.decode(value.data);
      print('result ==>> $result');

      for (var element in result) {
        FoodModel foodModel = FoodModel.fromMap(element);
        foodModels.add(foodModel);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return foodModels.isEmpty
        ? const ShowProgress()
        : LayoutBuilder(
            builder: (BuildContext context, BoxConstraints boxConstraints) {
            return ListView.builder(
              itemCount: foodModels.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  print('You Tap index ==> $index');
                  MyDialog(context: context).normalDialog(
                      label1: 'Edit',
                      pressFunc1: (){},
                      label2: 'Delete',
                      pressFunc2: (){},
                      contentWidget: Image.network(
                          'https://www.androidthai.in.th${foodModels[index].image}'),
                      title: foodModels[index].nameFood,
                      subTitle: foodModels[index].detail);
                },
                child: Card(
                  child: Row(
                    children: [
                      SizedBox(
                        width: boxConstraints.maxWidth * 0.5 - 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                              'https://www.androidthai.in.th${foodModels[index].image}'),
                        ),
                      ),
                      SizedBox(
                        width: boxConstraints.maxWidth * 0.5 - 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ShowText(
                              text: foodModels[index].nameFood,
                              textStyle: MyConstant().h2Style(),
                            ),
                            ShowText(
                              text: '${foodModels[index].price} thb',
                              textStyle: MyConstant().h1Style(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
  }
}
