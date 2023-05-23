import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopz_ecom/controllers/product_controller.dart';
import 'package:shopz_ecom/views/products_tile.dart';

class ShoppingHomePage extends StatelessWidget {
final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,color: Colors.black,)),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ShopZ',style: TextStyle(fontSize: 32,fontFamily: 'avenir',fontWeight: FontWeight.w900),),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.view_list_rounded)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.grid_view)),
                  ],
                )
              ],
            ),
            Expanded(
              child: Obx(()
                {
                  if(productController.isLoading.value){
                    return Center(child: CircularProgressIndicator(),);
                  }else{
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          childAspectRatio: .55,
                        ),
                        itemCount: productController.productList.length,
                        itemBuilder: (context,index){
                          return ProductTile(productController.productList[index]);
                        });
                  }
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
