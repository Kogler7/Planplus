import 'dart:convert';

class ConvertUtil{
  static String fluroCnParamsEncode(String oriCn){
    return jsonEncode(Utf8Encoder().convert(oriCn));
  }

  static String fluroCnParamsDecode(String tgtCn){
    var list = [];
    jsonDecode(tgtCn).forEach(list.add);
    String value = Utf8Decoder().convert(list);
    return value;
  }

  static String objToJson<T>(T t){
    return fluroCnParamsEncode(jsonEncode(t));
  }

  static Map<String,dynamic> JsonToMap(String json){
    return jsonDecode(fluroCnParamsDecode(json));
  }
}