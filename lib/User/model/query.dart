import 'package:flutter/material.dart';

class Query{
  String type;
  Map<String,dynamic> params;
  String endpoint;

  Query({Key key, this.type, this.params, this.endpoint});

}