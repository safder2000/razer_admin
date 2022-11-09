class Product {
  String id;
  final String name;
  final String description;
  final String spec;
  final double price;
  final double quantity;
  final List colors;
  final double rating;
  Product({
    this.id = '',
    required this.name,
    required this.description,
    required this.spec,
    required this.price,
    required this.quantity,
    required this.colors,
    required this.rating,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'spec': spec,
        'price': price,
        'quantity': quantity,
        'colors': colors,
        'rating': rating,
      };
}
