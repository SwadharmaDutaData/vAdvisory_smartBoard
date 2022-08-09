import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/models.dart';
import '../../services/services.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  Future<void> getProduct() async {
    ApiReturnValue<List<ProductModel>> result = await ProductServices.getProduct();

    if (result.value != null) {
      emit(ProductLoaded(result.value!));
    } else {
      emit(ProductLoadingFailed(result.message!));
    }
  }
}