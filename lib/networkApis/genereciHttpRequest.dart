import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:lodjinha/model/BannerModel.dart';

class GenericHttpRequest {
  dynamic _body;
  dynamic _header;
  String _url;

  GenericHttpRequest setBody(dynamic body) {
    this._body = body;
    return this;
  }

  GenericHttpRequest setHeader(dynamic header) {
    this._header = header;
    return this;
  }

  GenericHttpRequest setUrl(String url) {
    this._url = url;
    return this;
  }

  Future<ResponseReturn> invokePostUrlencoded() async {
    if (_header == null)
      _header = {"Content-Type": "application/x-www-form-urlencoded"};

    var url = this._url;
    final encoding = Encoding.getByName('utf-8');

    var response = await http.post(url,
        body: this._body, headers: _header, encoding: encoding);

    ResponseReturn ret = new ResponseReturn();
    var l = json.decode(response.body);
    ret.code = response.statusCode;

    if (ret.code != 200)
      ret.message = response.body;
    else
      ret.body = l;

    return ret;
  }

  Future<ResponseReturn> invokePost() async {
    if (_header == null) _header = {"Content-Type": "application/json"};

    var url = this._url;

    var response =
        await http.post(url, body: json.encode(this._body), headers: _header);

    ResponseReturn ret = new ResponseReturn();
    var l = json.decode(response.body);

    //print(" post : ${json.encode(this._body)}");
   // print(" Header : ${json.encode(this._header)}");

    ret.code = response.statusCode;

    if (ret.code != 200)
      ret.message = response.body;
    else
      ret.body = l;

    return ret;
  }
  Future<ResponseReturn> invokePostv1(String token  ) async {
    if (_header == null) _header = {"Content-Type": "application/json", HttpHeaders.authorizationHeader: "bearer $token"};

    var url = this._url;

    var response =
    await http.post(url, body: json.encode(this._body), headers: _header);

    ResponseReturn ret = new ResponseReturn();

    //print(" post : ${json.encode(this._body)}");
    // print(" Header : ${json.encode(this._header)}");

    ret.code = response.statusCode;

    if (ret.code != 201)
      ret.message = response.body;
    else
      ret.body = "Sucesso";

    return ret;
  }
  Future<ResponseReturn> invokePost_1(String body ) async {
    if (_header == null) _header = {"Content-Type": "application/json"};

    var url = this._url;

    var response =
    await http.post(url, body: body, headers: _header);

    ResponseReturn ret = new ResponseReturn();
    var l = json.decode(response.body);

    //print(" post : ${json.encode(this._body)}");
    // print(" Header : ${json.encode(this._header)}");

    ret.code = response.statusCode;

    if (ret.code != 200)
      ret.message = response.body;
    else
      ret.body = l;

    return ret;
  }

  Future<ResponseReturn> invokeGet() async {
    ResponseReturn ret = new ResponseReturn();
    try {
      var url = this._url;
      if (_header == null) _header = {"Content-Type": "application/json"};
      var response = await http.get(url, headers: this._header);

      var l = json.decode(response.body);


      ret.code = response.statusCode;
      if (ret.code != 200)
        ret.message = response.body;
      else
        ret.body = l;
    } catch (e) {
      ret.message = e.toString();
      print(e);
    }
    return ret;
  }

  Future<ResponseReturn> invokeGetIterable() async {
    ResponseReturn ret = new ResponseReturn();
    try {
      var url = this._url;
      var response =
          await http.get(url, headers: {"Content-Type": "application/json"});

      var l = json.decode(response.body);//.cast<BannerModel, dynamic>();

      ret.code = response.statusCode;
      if (ret.code != 200)
        ret.message = response.body;
      else
        ret.body = l;
    } catch (e) {
      ret.message = e.toString();
      print(e);
    }
    return ret;
  }
}

class ResponseReturn {
  int code;
  dynamic body;
  String message;
}
