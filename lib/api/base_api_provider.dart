
import 'dart:io';

import 'package:get/get.dart';

class ApiProvider extends GetConnect {

  final String contentType = 'application/json';
  final String token = '12342342342314sfadfqwerewqrwerewrewqr2er213reqedeqw';

  final String BASE_URL = "https://shippin.coderootz.com/api/";
 // final String BASE_URL = 'https://jsonplaceholder.typicode.com/posts';

  Future<Response> getRequest() =>
      get(BASE_URL);


  Future<Response> postRequest(String endpoint, Map<String,dynamic> map) => post(
        BASE_URL+endpoint,
        map,
    headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: contentType
    },
  );
}
