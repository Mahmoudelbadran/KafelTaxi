import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxizer/bussinus_logic/user_logic/home_user_logic.dart';

import 'item_program_view/item_program_car.dart';

class ItemBuilderView extends StatelessWidget {
  const ItemBuilderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late HomeUserLogic cubit = HomeUserLogic.get(context);
    return BlocBuilder<HomeUserLogic, HomeUserState>(
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) =>
                ItemProgramCar(
                  dataDriver: cubit.nearestResponse.nearestDriver[index],),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: cubit.nearestResponse.nearestDriver.length);
      },
    );
  }
}