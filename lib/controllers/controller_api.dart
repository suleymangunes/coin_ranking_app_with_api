import 'package:get/get.dart';
import 'package:wnetworking/wnetworking.dart';

class ControllerApi extends GetxController{
  RxString dropdownValue = 'English'.obs;
  var themDark = false.obs;
  var seciliNavigation = 0.obs;
  var favourited = [].obs;
  var sonuclar = [].obs;
  var hata = 0.obs;
  void hataOldu(){
    hata = hata + 1;
  }

  static const _apiKey = 'b899eac9-4ac5-41b7-816e-9b992c79cd85';
  static const _url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency';

  Future<dynamic> getListingLatest(int limit) async {

    var url = '$_url/listings/latest?start=1&limit=$limit&convert=USD'; 
    var result = await HttpReqService.get<JMap>(
      url, 
      auth: AuthType.apiKey,
      authData: const MapEntry('X-CMC_PRO_API_KEY', _apiKey)
    );

    if (result != null) {
      for (var i=0; i<result["data"].length; i++){
        sonuclar.add([{
          "id": result["data"][i]["id"],
          "name": result["data"][i]["name"],
          "symbol": result["data"][i]["symbol"],
          "price": result["data"][i]["quote"]["USD"]["price"],
          "volume_24": result["data"][i]["quote"]["USD"]["volume_24h"],
          "volume_change_24": result["data"][i]["quote"]["USD"]["volume_change_24h"],
          "percent_change_1h": result["data"][i]["quote"]["USD"]["percent_change_24h"],
          "percent_change_24h": result["data"][i]["quote"]["USD"]["percent_change_1h"],
          "percent_change_7d": result["data"][i]["quote"]["USD"]["percent_change_7d"],
          "percent_change_30d": result["data"][i]["quote"]["USD"]["percent_change_30d"],
          "percent_change_60d": result["data"][i]["quote"]["USD"]["percent_change_60d"],
          "percent_change_90d": result["data"][i]["quote"]["USD"]["percent_change_90d"],
          "market_cap": result["data"][i]["quote"]["USD"]["market_cap"],
          "market_cap_dominance": result["data"][i]["quote"]["USD"]["market_cap_dominance"]
          }]
        );
      }
    }
    if (sonuclar.length == limit*2) {
      for (var i=0; i<limit; i++) {
        sonuclar.removeAt(0);
      }
    }
  }
}
