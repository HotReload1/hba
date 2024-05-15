import 'package:cloud_firestore/cloud_firestore.dart';

List<RoomsModel> getRoomListFromListMap(List<QueryDocumentSnapshot> list) =>
    List<RoomsModel>.from(
        list.map((x) => RoomsModel.fromQueryDocumentSnapshot(x)));

class RoomsModel {
  String? id;
  String? imageUrl;
  String? type;
  int? price;
  String? hotelId;
  double? rating;
  String? description;

  RoomsModel(
      {this.id,
      this.imageUrl,
      this.price,
      this.hotelId,
      this.type,
      this.rating,
      this.description});

  RoomsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    hotelId = json['hotelId'];
    rating = json['rating'];
    imageUrl = json['imageUrl'];
    type = json['type'];
  }

  RoomsModel.fromQueryDocumentSnapshot(QueryDocumentSnapshot json) {
    id = json.id!;
    price = json['price'];
    hotelId = json['hotelId'];
    rating = json['rating'] is int ? json['rating'].toDouble() : json['rating'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    //description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;

    data['price'] = price;
    data['hotel_id'] = hotelId;

    data['rating'] = rating;

    return data;
  }
}
