import 'package:ecommerce/core/constans/app_urls.dart';

class ImageDisplayHelper {
  static String generateCategoryImageURL(String title) {
    return AppUrls.categoryImage + title + AppUrls.alt;
  }

  static String generateProductImageURL(String title) {
    return AppUrls.productImage + title + AppUrls.alt;
  }
}
