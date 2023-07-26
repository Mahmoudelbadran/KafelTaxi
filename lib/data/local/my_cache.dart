import 'package:shared_preferences/shared_preferences.dart';
import '../../core/my_cache_keys/my_cache_keys.dart';
class MyCache{
  static SharedPreferences? preferences;
  static Future<void> initcachce()async{
    preferences=await SharedPreferences.getInstance();
  }
  static void putString({required MyCacheKeys keys,required String value}){
    preferences!.setString(keys.name,value);
  }
  static String? getString({required MyCacheKeys keys,}){
    return preferences!.getString(keys.name) ?? "";
  }
  static void putInt({required MyCacheKeys keys,required int value}){
    preferences!.setInt(keys.name,value);
  }
  static int? getInt({required MyCacheKeys keys,}){
    return preferences!.getInt(keys.name) ?? 0;
  }
  static void putdouble({required MyCacheKeys keys,required double value}){
    preferences!.setDouble(keys.name,value);
  }
  static double getdouble({required MyCacheKeys keys,}){
    return preferences!.getDouble(keys.name) ?? 0.00;
  }
  static void putbool({required MyCacheKeys keys,required bool value}){
    preferences!.setBool(keys.name,value);
  }
  static bool getbool({required MyCacheKeys keys,}){
    return preferences!.getBool(keys.name) ?? false;
  }
  static void putListString({required MyCacheKeys keys,required List<String> value}){
    preferences!.setStringList(keys.name,value);
  }
  static List getListString({required MyCacheKeys keys,}){
    return preferences!.getStringList(keys.name) ?? [];
  }
  static void removeFormcache({required MyCacheKeys keys}){
    preferences!.remove(keys.name);
  }
  static void clearCache(){
    preferences!.clear();
  }
}