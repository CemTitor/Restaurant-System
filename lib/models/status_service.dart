import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant_system/models/status.dart';

class  StatusService{
  final FirebaseFirestore _firestore= FirebaseFirestore.instance;

 Future<void> addStatus(String status,String image) async{



    var ref = _firestore.collection("Status");

    var documentRef = await ref.add({
      'status' : status,
      'image' : image
    });

    return Status(id: documentRef.id, status: status,image:image);


  }
}