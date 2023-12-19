class Product{
  String image;
  String description;
  double price;
  String bestFor;

  Product({required this.image,required this.description,required this.price,required this.bestFor});

  factory Product.fromJson(Map<String, dynamic> json) {
    

    if (json['image']  == null) {
      print('Image field is null');
    }
    if (json['description'] == null) {
      print('Description field is null');
    }
    if (json['price'] == null) {
      print('Price field is null');
    }
    if (json['best_for'] == null) {
      print('BestFor field is null');
    }
  
    return Product(
      image: json['image'],
      description: json['description'],
      price: json['price'],
      bestFor: json['best_for'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = image;
    data['description'] = description;
    data['price'] = price;
    data['best_for'] = bestFor;
    return data;
  }
}