import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voting_poll/services/provider/pollprovider.dart';
import 'package:voting_poll/utilis/colors.dart';

class PollsContainer extends StatefulWidget {
  const PollsContainer({super.key});

  @override
  State<PollsContainer> createState() => _PollsContainerState();
}

class _PollsContainerState extends State<PollsContainer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PollsProvider>(
      builder: (context, model, child) => Card(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Add Polls Titls',
                        hintStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      cursorColor: AppColors.primary,
                      maxLines: 2,
                      minLines: 1,
                      validator: (value) {
                        if (value!.length == 0) {
                          return 'Enter Title';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        model.addPollTitle(value!);
                      },
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  for (int i = 0; i < model.pollsOptions.length; i++)
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              model.removeOption();
                            },
                            icon: const Icon(Icons.close),
                          ),
                          Expanded(
                              child: TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'Add options',
                                hintStyle: TextStyle(fontSize: 18),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                            validator: (value) {
                              if (value!.length == 0) {
                                return 'Enter Option';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              model.pollsOptions[i] = value!;
                              model.pollsWeights[value] = 0;
                            },
                          ))
                        ],
                      ),
                    )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        ///add a poll promt when five or more options are created
                        /////will do it later
                        model.addPollOption();
                      },
                      child: const Text("Add an Option")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PollsWidgets extends StatefulWidget {
  final String decisionId, decisionTitle, creatorId;
  final Map pollWeights, usersVoted;
  //usersWhoVoted;

  const PollsWidgets({
    super.key,
    required this.decisionId,
    required this.decisionTitle,
    required this.creatorId,
    required this.pollWeights,
    required this.usersVoted,
    //required this.usersWhoVoted
  });

  @override
  State<PollsWidgets> createState() => _PollsWidgetsState();
}

class _PollsWidgetsState extends State<PollsWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Card(
        shadowColor: Colors.grey.shade500.withOpacity(0.2),
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: Colors.grey.shade600),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.decisionTitle,
                    style: const TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),

            
          ],
        ),
      ),
    );
  }
}











// FlutterPolls(
            //     pollId: "1",
            //     onVoted: (PollOption pollOption, int newTotalVotes) {
            //       print('Voted: ${pollOption.id}');
            //     },
            //     pollTitle: pollTitle,
            //     pollOptions: pollOptions)

            //  Polls(
            //   iconColor: Colors.black,
            //   children: [
            //     for(int i = 0;
            //     i < widget.pollWeights.keys.toList().length; i++)
            //     Polls.options(
            //       title: widget.pollWeights.keys.toList()[i],
            //        value: (widget.pollWeights.values.toList()[i])
            //        )
            //   ],
            //   allowCreatorVote: true,
            //    question: const Text(''),
            //    outlineColor: AppColors.primary.withOpacity(0.6),

            //    currentUser: currUser!.uid,
            //    creatorID: widget.creatorId,

            //     voteData: widget.usersVoted,
            //     leadingBackgroundColor: AppColors.primary,
            //     userChoice: widget.pollWeights.keys
            //     .toList()
            //     .indexOf(widget.usersVoted[widget.decisionId]),
            //     onVoteBackgroundColor: AppColors.primary.withOpacity(0.6),

            //     backgroundColor: Colors.transparent,

            //     onVote: (choice)async{
            //       Map usersVoted = widget.usersVoted;
            //       Map thisPollweight = widget.pollWeights;
            //       var selectedOption =
            //       widget.pollWeights.keys.toList() [choice - 1];
            //       setState(() {
            //         thisPollweight[selectedOption] =
            //         thisPollweight[selectedOption] + 1;

            //         usersVoted[currUser!.uid] =
            //         widget.pollWeights.keys.toList()[choice -1];
            //       });

            //       await FirebaseFirestore.instance
            //       .collection('decision')
            //       .doc(widget.decisionId)
            //       .update({
            //         'pollWeights': thisPollweight,
            //         'usersVoted': usersVoted,
            //       });
            //     },
            //     ),