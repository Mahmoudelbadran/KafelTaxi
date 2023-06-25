import 'package:flutter/material.dart';

import 'item_program_view/item_program_car.dart';

class ItemBuilderView extends StatelessWidget {
  const ItemBuilderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        itemBuilder: (context, index) => const ItemProgramCar(),
        separatorBuilder: (context, index) => const Divider(),
        itemCount:10);
  }
}
