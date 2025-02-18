class Product{
  final int id;
  final String? documentId;
  final String name;
  final String description;
  final double price;
  final DateTime? createdAt;
  final DateTime? publishedAt;

  /**
   * Constructor especificando que datos son requeridos y cuales no.
   * Los datos que no son requeridos llevan un signo de interrogacion luego
   * del tipo de datos en la declaracion de la variable global de la clase
   */
  Product({
    required this.id,
    this.documentId,
    required this.name,
    required this.description,
    required this.price,
    this.createdAt,
    this.publishedAt,
});


  factory Product.fromJson(Map<String, dynamic> json){
    if(json['attributes'] != null){
      final attributes = json['attributes'];
      return Product(
        id: json['id'],
        documentId: attributes['documentId'],
        name: attributes['name'],
        description: attributes['description'],
        price: double.parse(attributes['price'].toString()),
        createdAt: DateTime.parse(attributes['createdAt'].toString()),
        publishedAt: DateTime.parse(attributes['publishedAt'].toString()),
      );
    }
    return Product(
      id: int.parse(json['id'].toString()),
      documentId: json['documentId'],
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      publishedAt: json['publishedAt'] != null ? DateTime.parse(json['publishedAt']) : null,
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'name' : name,
      'description' : description,
      'price' : price,
    };
  }
}
