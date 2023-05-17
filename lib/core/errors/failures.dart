import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

abstract class Failures {
  final String errormassage;
  Failures(this.errormassage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errormassage);
  factory ServerFailure.fromDioErroe(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection Timeout with Api Server');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send Timeout with Api Server');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Recine Timeout with Api Server');
      case DioErrorType.badCertificate:
        return ServerFailure('Connection Timeout with Api Server');

      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data!);
      case DioErrorType.cancel:
        return ServerFailure('Cancel Api Server');

      case DioErrorType.connectionError:
        return ServerFailure('Connection Error  with Api Server');

      case DioErrorType.unknown:
        ServerFailure('Unexpected error');
        break;
    }
    return ServerFailure('errormassage');
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('reauest Not Found, please try leter');
    } else if (statusCode == 500) {
      return ServerFailure('internal server error, please try again ');
    } else {
      return ServerFailure(' OPPS! there is Error');
    }
  }
}
