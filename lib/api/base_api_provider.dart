
import 'dart:io';

import 'package:get/get.dart';

class ApiProvider extends GetConnect {

  final String contentType = 'application/json';
  final String token = '12342342342314sfadfqwerewqrwerewrewqr2er213reqedeqw';

  final String BASE_URL = "https://hyperlocal.coderootz.com/api/";
 

  Future<Response> getRequest(String endpoint) =>
      get(BASE_URL+endpoint);


  Future<Response> postRequest(String endpoint, Map<String,dynamic> map) => post(
        BASE_URL+endpoint,
        map,
    headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: contentType
    },
  );
}
