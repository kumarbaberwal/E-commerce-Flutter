import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/domain/product/repository/product_repository.dart';
import 'package:ecommerce/service_locator.dart';

class IsFavoriteUseCase extends Usecase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<ProductRepository>().isFavorite(params!);
  }
}
