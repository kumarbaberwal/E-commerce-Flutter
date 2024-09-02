import 'package:ecommerce/domain/product/entity/product_entity.dart';

class ProductPriceHelper {
  static double provideCurrentPrice(ProductEntity productEntity) {
    return productEntity.discountedPrice != 0
        ? productEntity.discountedPrice.toDouble()
        : productEntity.price.toDouble();
  }
}
