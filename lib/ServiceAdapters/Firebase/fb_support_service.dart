
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:foodloop/ServiceAdapters/Interface/support_service.dart';
import 'package:foodloop/Entities/support_entity.dart';
import 'package:image_picker/image_picker.dart';

class FbSupportService implements SuportServiceAdapter{
  
  final CollectionReference supportCollection = FirebaseFirestore.instance.collection("support");

  static Support userFromJason(Map<dynamic, dynamic> json) {
    try {
      return Support(
        json["UserId"],
        json["Photo"],
        json["order"]
      );
    } catch(e) {
      throw Exception("Unable to parse user $json");
    }
  }
  Future<String> uploadPhoto(XFile photo, String purchaseId, String userId) async {
    try {
      final FirebaseStorage storage = FirebaseStorage.instance;
      final String filename = 'soporte-$purchaseId-$userId-${DateTime.now()}.jpg';
      final Reference ref = storage.ref().child('supports/$filename');
      await ref.putFile(File(photo.path));
      String urlPhotoFirebase = await ref.getDownloadURL();
      final Map<String, dynamic> data = {
  'url': urlPhotoFirebase,"purchaseId":purchaseId,"userId":userId

};
      await supportCollection.add(data);

      return urlPhotoFirebase;
    } catch (e) {
      // print(e);
      // inspect(e);
      return "null";
    }
  }
}