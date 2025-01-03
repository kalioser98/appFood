import 'package:image_picker/image_picker.dart';

abstract class SuportServiceAdapter {
  Future<String> uploadPhoto(XFile photo, String purchaseId, String userId);
}