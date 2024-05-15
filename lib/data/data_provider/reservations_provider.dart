import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/firebase/firestore_keys.dart';

class ReservationProvider {
  Future<QuerySnapshot<Map<String, dynamic>>> getReservations() async {
    return await FirebaseFirestore.instance
        .collection(FireStoreKeys.bookedRooms_collections)
        .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
  }
}
