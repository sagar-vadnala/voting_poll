import 'package:flutter/material.dart';

class PollsProvider extends ChangeNotifier{

  List pollsOptions = ['',''];

  Map pollsWeights = {};

  String pollTitle = '';

  //functions
///
//////

  // addPollOptions(List value){
  //   pollsOptions = value;
  //   notifyListeners();
  // }

  addPollWeights(Map value){
    pollsWeights = value;
    notifyListeners();
  }

  addPollTitle (String value ){
    pollTitle = value;
    notifyListeners();
  }

///above pollsoptions has two empty value here down we are adding another empty option when clicked
  addPollOption(){
    pollsOptions.add('');
    notifyListeners();
  }


  // removeOption(int index){
  //   pollsOptions.removeAt(index);
  //   notifyListeners();
  // }

  // removeOptionWeight(int index){
  //   pollsWeights.removeAt(index);
  //   notifyListeners();
  // }


  removeOption(){
    pollsOptions.removeLast();
    notifyListeners();
  }

}
