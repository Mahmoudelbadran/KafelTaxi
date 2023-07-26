import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/bussinus_logic/user_logic/person_user_logic/person_user_logic.dart';
import 'package:taxizer/data/local/my_cache.dart';
import '../../../../core/my_cache_keys/my_cache_keys.dart';
import '../../../bussinus_logic/driver_logic/home_driver_logic.dart';
import 'item_driver/item_driver.dart';


class HistoryDriverItem extends StatelessWidget {
  const HistoryDriverItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String? token=MyCache.getString(keys: MyCacheKeys.token);
    HomeDriveLogic userdata = HomeDriveLogic.get(context)..getDriverProfile(token: token.toString());
    return BlocBuilder<PersonUserLogic, PersonUserState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 7.sp),
              width: 90.w,
              height: 85.h,
              child: ListView.separated(
                itemBuilder: (context, index) => ItemHistoryDriver(
                  order: 'تمت العمليه',
                  data: userdata.profileDriverRespone.result.history[index],
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: userdata.profileDriverRespone.result.history.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
