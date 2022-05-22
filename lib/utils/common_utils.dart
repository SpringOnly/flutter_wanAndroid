import 'package:flustars/flustars.dart';


/// map强转成Map<String, dynamic>
Map<String, dynamic>? getSpMap(String json){
 return SpUtil.getObject(json)?.cast<String, dynamic>();
}