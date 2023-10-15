import 'dart:ui';

import 'package:flutter/material.dart';

class CategorySection{
  final String categoryName;
  final Color color;
  final int id;
  CategorySection({required this.color,required this.categoryName,required this.id});

  Map<String,dynamic> toMap()=> {'categoryName':categoryName,'color':color.value,'id':id};

  factory CategorySection.fromMap(Map<String,dynamic> map)=>CategorySection(color: Color(map['color']), categoryName: map['categoryName'], id: map['id']);
}