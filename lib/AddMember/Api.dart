import 'package:firebase_storage/firebase_storage.dart' as fb;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shaddiadmin/Theme.dart';

class FirebaseController {
  static FirebaseController get instanace => FirebaseController();
  Future<String> saveUserImageToFirebaseStorage(userImageFile) async {
    String filePath = 'userImages/$id';
    try {
      //Upload Profile Photo

      fb.Reference storageReference = FirebaseStorage().ref().child(filePath);
      fb.UploadTask uploadTask = storageReference.putFile(userImageFile);

      fb.TaskSnapshot storageTaskSnapshot =
          await uploadTask.whenComplete(() {});
      String imageURL = await storageTaskSnapshot.ref.getDownloadURL();
      print("Url is" + imageURL);
      return ""; // Image URL from

    } catch (e) {
      print(e.message);
      return null;
    }
  }

  //
}
