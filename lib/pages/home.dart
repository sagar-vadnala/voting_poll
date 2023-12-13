import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voting_poll/pages/addDecision.dart';
import 'package:voting_poll/pages/dashboard.dart';
import 'package:voting_poll/utilis/colors.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

  void onTapped (int index){
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }
  int selectedIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Decision"),
        actions: [
          IconButton(onPressed: ()async{
            await FirebaseAuth.instance.signOut();
          },
           icon: const Icon(Icons.logout),
           ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          Dashboard(),
          AddDecision(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home,),
          label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.add,),
          label: 'Add Decision'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
    );
  }
}