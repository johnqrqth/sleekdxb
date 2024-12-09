import 'package:equatable/equatable.dart';

class Property extends Equatable {
  final int id;
  final String title;
  final String description;
  final double price;
  final String location;
  final String imageUrl;

  const Property({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.imageUrl,
  });

  @override
  List<Object?> get props =>
      [id, title, description, price, location, imageUrl];

  Property.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        title = json['title'] ?? '',
        description = json['description'] ?? '',
        price = json['price'] ?? '',
        location = json['location'] ?? '',
        imageUrl = json['imageUrl'] ?? '';

  static List<Property> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? []
        : json.map((value) => Property.fromJson(value)).toList();
  }

  static List<Property> property = [
    const Property(
      id: 1,
      title: "Lakefront Cottage",
      description: "A charming cottage with direct access to the lake.",
      price: 23430.00,
      location: "Lake Tahoe",
      imageUrl: "https://dummyimage.com/300",
    ),
    const Property(
        id: 2,
        title: "Modern Loft",
        description: "A charming cottage with direct access to the lake.",
        price: 1200.00,
        location: "Lake Tahoe",
        imageUrl: "https://dummyimage.com/300"),
    const Property(
      id: 3,
      title: "Urban Studio",
      description: "A charming cottage with direct access to the lake.",
      price: 1000.00,
      location: "Lake Tahoe",
      imageUrl: "https://dummyimage.com/300",
    ),
  ];
}
