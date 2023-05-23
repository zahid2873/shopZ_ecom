import 'package:get/get.dart';

import '../models/product_model.dart';
import '../services/remote_services.dart';

class ProductController extends GetxController{
  var productList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();
    super.onInit();
  }

  void fetchProducts()async{
    isLoading(true);
   try {
     var products = await RemoteService.fetchProduct();
     if(products != null){
       productList.value = products;
     }

   }finally {
     isLoading(false);
   }
  }

}