


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voting_poll/services/functions/authFunctions.dart';

saveDecision (Map pollsWeights, String title)async{
  await FirebaseFirestore.instance.collection('decision').add({
    'pollWeights' : pollsWeights,
    'uid' : currUser!.uid,
    'usersVoted' : {},
    'title': title,

  });
}