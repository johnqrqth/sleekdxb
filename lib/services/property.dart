import 'dart:convert';

import 'package:sleekdxb/models/property_model.dart';
import 'package:http/http.dart' as http;

class PropertyService {
  String apiUrl = "http://localhost:8000/api";
  //
  //returns a list of properties
  //

  Future<List<Property>> fetchPropertyList() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/properties'));

      final data = json.decode(response.body);
      return Property.listFromJson(data);
    } catch (e) {
      throw Exception("failed to fetch properties");
    }
  }

  //
  //adds a property
  //

  Future<Property> addProperty(Property property) async {
    try {
      final response =
          await http.post(Uri.parse('$apiUrl/property'), body: property);

      final data = json.decode(response.body);
      return Property.fromJson(data);
    } catch (e) {
      throw Exception("failed to add property");
    }
  }

  //
  //deletes a property
  //

  Future<Property> deleteProperty(id) async {
    try {
      final response = await http.delete(Uri.parse('$apiUrl/property/$id'));

      final data = json.decode(response.body);
      return Property.fromJson(data);
    } catch (e) {
      throw Exception("failed to delete property");
    }
  }
}
