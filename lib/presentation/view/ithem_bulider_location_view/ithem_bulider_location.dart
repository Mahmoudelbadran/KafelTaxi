import 'package:flutter/material.dart';
import 'ithem_style_view/item_view.dart';

class ItemBuilderLocation extends StatelessWidget {

  const ItemBuilderLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) =>const ItemView(),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 4);
  }
}
