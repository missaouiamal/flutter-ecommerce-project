class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final List<String> imgsUrl;


  Product({
    this.id,
    this.name,
    this.description,
    this.category,
    this.price,
    this.imgsUrl
  });


  Product.fromJson(Map<dynamic, dynamic> json):
    category = "123",
     id= json["_id"],
      name= json["name"],
      description= json["description"],
      price= double.parse(json["price"]),
      imgsUrl= List<String>.from(json["imgUrls"].map((x) => x));
  
  // {
   
  //   return Product(
  //     id: json["_id"],
  //     name: json["name"],
  //     // description: json["description"],
  //     // price: double.parse(json["price"]),
  //     // imgsUrl: json["imgUrls"].map((i)=>i).toList(),
      
  //   );
  // }

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "imgsUrl": imgsUrl,
       
      };
}
