import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hba/data/model/bookedRoom.dart';

import '../../core/firebase/firestore_keys.dart';

class BookRoomProvider {
  Future<DocumentReference<Map<String, dynamic>>> bookRoom(
      BookedRoom bookedRoom) async {
    return await FirebaseFirestore.instance
        .collection(FireStoreKeys.bookedRooms_collections)
        .add(bookedRoom.toMap());
  }
}
