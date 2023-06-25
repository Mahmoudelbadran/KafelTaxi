import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taxizer/core/chang_page/controle_page.dart' as screens;
import '../../screens/home_screens/user/person/screens_single_person/share/share_screen.dart';
import '../../style/style.dart';

class PersonUserView extends StatelessWidget {
  const PersonUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      color: backgroundcolor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(2.sp),
            width: 25.w,
            height: 12.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.sp),
                border: Border.all(color: ycolor, width: 3.sp)),
            child: Image.asset("images/usericons.png"),
          ),
          Container(
            padding: EdgeInsets.all(10.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "محمود بدران",
                  style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: textcolor),
                ),
                Text(
                  "+0201033093103",
                  style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                      color: textcolor.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              "اعدادات الحساب",
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: textcolor),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, screens.UpdateUser);
            },
            leading: const Icon(Icons.arrow_back_ios),
            title: const Text(
              "معلومات الملف الشخصي",
              textAlign: TextAlign.end,
            ),
            subtitle: const Text(
              "تغير معلومات حسابك",
              textAlign: TextAlign.end,
            ),
            trailing: Icon(
              Icons.person_outline,
              size: 25.sp,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, screens.HistoryUser);
            },
            leading: const Icon(Icons.arrow_back_ios),
            title: const Text(
              "تاريخ الركوب",
              textAlign: TextAlign.end,
            ),
            subtitle: const Text(
              "عرض تاريخ رحلتلك",
              textAlign: TextAlign.end,
            ),
            trailing: Icon(
              Icons.history,
              size: 25.sp,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          ListTile(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 12.h,
                    child: const ShareScreen(),
                  );
                },
              );
            },
            leading: const Icon(Icons.arrow_back_ios),
            title: const Text(
              "الرجوع الي الاصدقاء",
              textAlign: TextAlign.end,
            ),
            subtitle: const Text(
              "مشاركه هذا التطبيق مع اصدقائك",
              textAlign: TextAlign.end,
            ),
            trailing: Icon(
              Icons.share,
              size: 25.sp,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, screens.NoticScreen);
            },
            leading: const Icon(Icons.arrow_back_ios),
            title: const Text(
              "الاشعارات",
              textAlign: TextAlign.end,
            ),
            subtitle: const Text(
              "اداره اشعارتك",
              textAlign: TextAlign.end,
            ),
            trailing: Icon(
              Icons.notifications,
              size: 25.sp,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, screens.RateScreen);
            },
            leading: const Icon(Icons.arrow_back_ios),
            title: const Text(
              "قيم لنا",
              textAlign: TextAlign.end,
            ),
            subtitle: const Text(
              "معدل التقيم لدينا علي جوجل بلاي",
              textAlign: TextAlign.end,
            ),
            trailing: Icon(
              Icons.star,
              size: 25.sp,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          ListTile(
            onTap: () {

            },
            leading: const Icon(Icons.arrow_back_ios),
            title: const Text(
              "تسجيل خروج",
              textAlign: TextAlign.end,
            ),
            subtitle: const Text(
              "تسجيل الخروج من حسابك",
              textAlign: TextAlign.end,
            ),
            trailing: Icon(
              Icons.output_outlined,
              size: 25.sp,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
