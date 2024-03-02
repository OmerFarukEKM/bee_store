class ProductModel {
  final String uid;
  final String titleSnackers;
  final String imageAddress;
  final double usdPrice;
  final double discount;

  ProductModel({
    required this.uid,
    required this.titleSnackers,
    required this.usdPrice,
    required this.imageAddress,
    required this.discount,
  });

  factory ProductModel.fromFirestore(Map map, String uid) {
    return ProductModel(
        discount: map["discount"],
        uid: uid,
        titleSnackers: map["titleSnackers"],
        usdPrice: map["usdPrice"],
        imageAddress: map["imageAddress"]);
  } //  factoryi araştır
}
