import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/product/models/product_model.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProductFirebaseService {
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity productEntity);
  Future<bool> isFavorite(String productId);
  Future<Either> getNewIn();
  Future<Either> getProductsByCategoryId(String categoryId);
  Future<Either> getProductsByTitle(String title);
  Future<Either> getTopSelling();
  Future<Either> getFavoritesProducts();
}

class ProductFirebaseServiceImpl extends ProductFirebaseService {
  @override
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity productEntity) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Favourites')
          .where('productId', isEqualTo: productEntity.productId)
          .get();

      if (products.docs.isNotEmpty) {
        await products.docs.first.reference.delete();
        return const Right(false);
      } else {
        FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .collection('Favourites')
            .add(productEntity.fromEntity().toMap());
        return const Right(true);
      }
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getNewIn() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('createdDate', isGreaterThanOrEqualTo: DateTime(2024, 8, 27))
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please Try Again!');
    }
  }

  @override
  Future<Either> getProductsByCategoryId(String categoryId) async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please Try Again!');
    }
  }

  @override
  Future<Either> getProductsByTitle(String title) async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('title', isGreaterThanOrEqualTo: title)
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please Try Again!');
    }
  }

  @override
  Future<Either> getTopSelling() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('salesNumber', isGreaterThanOrEqualTo: 20)
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please Try Again!');
    }
  }

  @override
  Future<bool> isFavorite(String productId) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var products = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Favourites')
          .where('productId', isEqualTo: productId)
          .get();

      if (products.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
  
  @override
  Future<Either> getFavoritesProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Favourites')
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please Try Again!');
    }
  }
}
