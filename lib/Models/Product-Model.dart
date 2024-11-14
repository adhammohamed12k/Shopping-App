class ProductModel
{
List<dynamic> data;
  ProductModel({required this.data});
  factory ProductModel.fromjson(Map<String ,dynamic>json)
  {
    return ProductModel(data: json['data']['products']);
  }
}