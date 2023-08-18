import 'package:ecommerceapp/core/model/cartmodel.dart';
import 'package:ecommerceapp/core/model/products.dart';
import 'package:ecommerceapp/core/model/wishlistmodel.dart';


import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }
  Future<Isar> openDB() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    final dbPath = appDirectory.path;

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([ProductSchema, CartModelSchema, WishListModelSchema],
          directory: dbPath);
    }
    return await Future.value(Isar.getInstance());
  }

////////////////////saveProductsToIsar///////////////////////getProductsfromisar//////////////////
  void saveProductsToIsar(List<Product> products) async {
    final isar = await db;
    isar.writeTxn(() async {
      isar.products.putAll(products).then(
            (value) => print(value),
          );
    });
  }

  Future<List<Product>> getProductsfromisar() async {
    final isar = await db;
    return await isar.products.where().findAll();
  }

////////////addcarttoisar ///////////getcartsfromisar////////deletecartproductfromisar////////////
  Future<void> addcartProducttoisar(CartModel cart) async {
    final isar = await db;
    isar.writeTxn(() => isar.cartModels.put(cart));
  }

  Future<List<CartModel>> getcartProductfromisar() async {
    final isar = await db;
    return await isar.cartModels.where().findAll();
  }

  Future<void> deletecartproductfromisar(CartModel cartproduct) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.cartModels.delete(cartproduct.isarId);
    });
  }

////addFavoriteproducttoisar///////getFavoriteproductfromisar///////Filters///////////////
  Future<void> addFavoriteproducttoisar(WishListModel product) async {
    final isar = await db;
    isar
        .writeTxn(() => isar.wishListModels.put(product))
        .then((value) => print(value));
  }

  Future<List<WishListModel>> getFavoriteproductfromisar() async {
    final isar = await db;
    return await isar.wishListModels.where().findAll();
  }

  Future<void> deleteFavoriteproductfromisar(WishListModel product) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.wishListModels.delete(product.isarId);
    });
  }

   Future<List<WishListModel>> searchprodutinwishlist(String searchTerm) async {
    final isar = await db;

    final tasks =
        await isar.wishListModels.filter().categoryBetween('A', 'Z').findAll();
    return tasks.where((task) => task.category!.contains(searchTerm)).toList();
  }
}
