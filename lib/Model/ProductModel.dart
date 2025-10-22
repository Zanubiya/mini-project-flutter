class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;
  String? note;
  String? details;


  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    this.note,
    this.details,
  });


  factory ProductModel.fromJson(Map<String,dynamic>json){
    return ProductModel(
        id:json['id'],
        title: json['title'],
        price: double.parse(json['price'].toString()),
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: Rating.fromJson(json['rating']),
        note: json['note'],
        details: json['details']


    );



  }

}

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String,dynamic>json){
    return Rating(
        rate: double.parse(json['rate'].toString()),
        count: json['count']


    );


  }



}