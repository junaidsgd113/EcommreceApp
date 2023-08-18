import 'package:ecommerceapp/core/model/products.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service/api_service.dart';
import '../service/isar_service.dart';

final homescreenprovider =
    StateNotifierProvider<HomescreenNotifier, List<Product>>((ref) => HomescreenNotifier());

class HomescreenNotifier extends StateNotifier<List<Product>> {
  HomescreenNotifier([List<Product>? intialHomescreen]) : super(intialHomescreen ?? []);

  final ApiProductService apiService = ApiProductService();
  final isarservice=IsarService();

  void fetchprodutsFromisardb() async {
    state=await isarservice.getProductsfromisar();
    if(state.isEmpty){
      List<Product> products=await apiService.fetchProducts();
      state=products;
      isarservice.saveProductsToIsar(products);
    }else{
      state=await apiService.fetchProducts();
    }
   
  }

 
}
