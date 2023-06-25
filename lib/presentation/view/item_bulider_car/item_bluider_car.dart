import 'package:flutter/material.dart';
import 'package:taxizer/presentation/model_data_onboarding/model_car_data.dart';

import 'item_car/item_car.dart';

class ItemBuilderCar extends StatelessWidget {

  const ItemBuilderCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ModelCarData> dataList=[
      ModelCarData(images: "images/limousine.svg",nameCar: "لموزين",number: "18",speed: "60",price: "20"),
      ModelCarData(images: "images/electriccar.svg",nameCar: "سياره كهربية",number: "64",speed: "80",price: "30"),
      ModelCarData(images: "images/carsports.svg",nameCar: "سياره رياضيه",number: "80",speed: "120",price: "35"),
    ];

    return  ListView.separated(
        itemBuilder: (context, index) => ItemCar(model:dataList[index]),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: dataList.length);

  }
}
