import 'package:flutter/material.dart';
import 'package:voting_poll/services/functions/firebaseFunctions.dart';
import 'package:voting_poll/services/provider/pollprovider.dart';
import 'package:provider/provider.dart';
import 'package:voting_poll/widgets/widgets.dart';

class AddDecision extends StatefulWidget {
  const AddDecision({super.key});

  @override
  State<AddDecision> createState() => _AddDecisionState();
}

class _AddDecisionState extends State<AddDecision> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PollsProvider>(
        builder: (context, model, child) =>Container(
          padding: const EdgeInsets.all(14),
          child: Form(key: _formKey,
          child: Column(
            children: [
              const PollsContainer(),
              const SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  saveDecision(model.pollsWeights, model.pollTitle);
                }
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Decision Uploaded')));
              }, child: const Text('Upload Decision'))
              // ElevatedButton(
              //   onPressed: (){}, child: Text('AddPoll')),
            ],
          ),),
        ),
      ),
    );
  }
}