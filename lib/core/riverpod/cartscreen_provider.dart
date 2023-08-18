import 'package:ecommerceapp/core/model/cartmodel.dart';
import 'package:ecommerceapp/core/service/isar_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final cartlistprovider =
    StateNotifierProvider<CartScreenNotifier, List<CartModel>>((ref) => CartScreenNotifier());

class CartScreenNotifier extends StateNotifier<List<CartModel>> {
  CartScreenNotifier([List<CartModel>? intialCartList]) : super(intialCartList ?? []);
void getcartsfromisar() async {
    state = await isarservice.getcartProductfromisar();
  }
  final isarservice=IsarService();
  void addproducttocartlist(CartModel product){
    state=[...state,product];
isarservice.addcartProducttoisar(product);

  }
  void removeproductfromcartlist(int id,CartModel product) {
    state = state.where((element) => element.isarId != id).toList();
    isarservice.deletecartproductfromisar(product);
  }
   int totalprice() {
    
    int totalPrice = 0;
    for (var product in state) {
      totalPrice += product.quantity! * product.price!.toInt();
    }

    return totalPrice;
  }

}