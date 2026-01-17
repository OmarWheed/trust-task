import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trust_task/data/models/category_dto.dart';
import 'package:trust_task/data/models/guest_id_response_dto.dart';
import 'package:trust_task/data/models/request/add_cart_request_dto.dart';
import 'package:trust_task/data/models/request/delete_cart_request_dto.dart';
import 'package:trust_task/data/models/response/cart_action_response_dto.dart';
import 'package:trust_task/data/models/response/cart_detatils_response_dto.dart';
import 'end_points.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;
  @GET(EndPoints.getGuestId)
  Future<GuestIdResponseDto> getGuestId();

  @GET(EndPoints.categoryies)
  Future<List<CategoryDto>> getCategories();

  @GET(EndPoints.getCartDetails)
  Future<CartDetailsResponseDto> getCartDetails(
    @Query('guest_id') String guestId,
  );
  @POST(EndPoints.addCart)
  Future<CartActionResponseDto> addCart(
    @Body() AddCartRequestDto addCartRequestDto,
  );
  @DELETE(EndPoints.deleteCart)
  Future<CartActionResponseDto> deleteCart(
    @Body() DeleteCartRequestDto deleteCartRequestDto,
  );
}
