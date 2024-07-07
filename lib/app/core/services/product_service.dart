import 'package:crud_auth/app/core/http/http_client.dart';
import 'package:crud_auth/app/models/dto/product_dto.dart';
import 'package:crud_auth/app/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductService {
  final HttpClient _client;

  ProductService(
    this._client,
  );

  Future<void> saveProduct(ProductDTO dto) async {
    String url = '${api}products/save';
    Response? response;

    try {
      response = await _client.post(url, data: dto.toMap());
    } on DioException catch (e) {
      if (e.response != null && [400, 404].contains(e.response!.statusCode)) {
        throw FlutterError(e.response!.data['message'].toString());
      }
    }

    if (response != null && response.statusCode == 200) {
      return;
    }
  }

  Future<List<ProductDTO>> getAllProducts() async {
    String url = '${api}products/all-products';
    List<ProductDTO> products = [];
    Response? response;

    try {
      response = await _client.get(url);
    } on DioException catch (e) {
      if (e.response != null && [400, 404].contains(e.response!.statusCode)) {
        throw FlutterError(e.response!.data['message'].toString());
      }
    }

    if (response != null && response.statusCode == 200) {
      for (var e in response.data) {
        products.add(ProductDTO.fromMap(e));
      }
      return products;
    }

    return products;
  }

  Future<ProductDTO?> updateProduct(ProductDTO dto) async {
    String url = '${api}products/update';
    ProductDTO? product;
    Response? response;

    try {
      response = await _client.put(url, data: dto.toMap());
    } on DioException catch (e) {
      if (e.response != null && [400, 404].contains(e.response!.statusCode)) {
        throw FlutterError(e.response!.data['message'].toString());
      }
    }

    if (response != null && response.statusCode == 200) {
      product = ProductDTO.fromMap(response.data);
    }

    return product;
  }

  Future<void> deleteProduct(String id) async {
    String url = '${api}products/$id';
    Response? response;

    try {
      response = await _client.delete(url);
    } on DioException catch (e) {
      if (e.response != null && [400, 404].contains(e.response!.statusCode)) {
        throw FlutterError(e.response!.data['message'].toString());
      }
    }

    if (response != null && response.statusCode == 200) {
      return;
    }
  }
}
