import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:voting_poll/widgets/widgets.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(14),
        child: Container(
          child: StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('decision').snapshots(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            // else (snapshot.hasData || snapshot.connectionState == ConnectionState.done) {
              else{
              final docs = snapshot.data!.docs;
              return ListView.builder(
                // shrinkWrap: false,
                // physics: AlwaysScrollableScrollPhysics(),
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  return 
                  // Container(
                  //   child: Text("sagar vadnala"),
                  // );
                   PollsWidgets(decisionId: docs[index].id, decisionTitle: docs[index]['title'], creatorId: docs[index]['uid'], pollWeights: docs[index]["pollWeights"], usersVoted: docs[index]['usersVoted'] );
                },
              );
            }
            
          },
          ),
        )
      ),
      // body: Container(
      //   padding: EdgeInsets.all(14),
      //   child: Container(
      //     child: ListView.builder(
      //       itemCount: PollsProvider.addPollOption.length,
      //       itemBuilder: (context, Index) {

      //       }
      //       ),
      //   ),
      );
  }
}