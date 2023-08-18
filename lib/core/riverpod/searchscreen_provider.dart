import 'package:ecommerceapp/core/model/products.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../service/api_service.dart';

final searchscreenprovider =
    StateNotifierProvider<SearchscreenNotifier, List<Product>>((ref) => SearchscreenNotifier());

class SearchscreenNotifier extends StateNotifier<List<Product>> {
  SearchscreenNotifier([List<Product>? intialsearchscreen]) : super(intialsearchscreen ?? []);

  final ApiProductService apiService = ApiProductService();

  void fetchSearchproduts(String query) async {
    state = await apiService.fetchSearchProducts(query);
  }
}
