import 'package:http/http.dart' as http;
import 'package:shopz_ecom/models/product_model.dart';

class RemoteService{
  static var client = http.Client();

  static Future<List<Product>?> fetchProduct()async{
    var url = 'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline';
    var responce = await client.get(Uri.parse(url));
    if(responce.statusCode == 200){
      var jsonString = responce.body;
      return productFromJson(jsonString);
    }else{
      print("Somthing wrong,API call failed");
      return null;
    }

  }
}
