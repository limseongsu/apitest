import 'package:get/get.dart';
import 'package:untitled/repository.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ViewModel extends GetxController {
  final List<Hits> _jsonF = [];


  List<Hits> get jsonF => _jsonF;

  ViewModel() {
    api();
    update();
  }



  Future<List<Hits>> api() async {
    var uri = Uri.parse(
        'https://pixabay.com/api/?key=17828481-17c071c7f8eadf406822fada3&q=iphone&image_type=photo');
    var response = await http.get(uri);
    Repository example = Repository.fromJson(json.decode(response.body));
    final jsonF = example.hits ?? [];
    jsonF.forEach((Hits item) {
      jsonF.add(item);
    });
    update();
    return jsonF;
  }
}