import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login.dart';

class PageViewData {
  PageViewData(
      {required this.image, required this.title, required this.statement});

  late String image, title, statement;
}
class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var pageVIewController = PageController();
  int pageIndex = 0;
  List<PageViewData> PageViewItems = [
    PageViewData(
        image: "image/doc.png",
        title: "Chat With Doctor",
        statement: "Here doctors can communicate easily with patients and vice versa"),
    PageViewData(
        image: "image/med.jpg",
        title: "medical records",
        statement: "The medical record has become on cloud where you can access from it without being afraid of losing anything"),
    PageViewData(
        image: "image/hos.jpeg",
        title: "Hospitals contact",
        statement: "Hospitals can communicate with each other to meet the needs of patients"),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,actions: [TextButton(child: Text("Skip",style:TextStyle(color: Colors.blue.shade900,fontSize: 17)),onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
      },)],),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 450,
            child: PageView.builder(
              controller: pageVIewController,
              itemBuilder: (context, index) => pageViewItem(PageViewItems, index),
              itemCount: PageViewItems.length,
              physics: BouncingScrollPhysics(),
              onPageChanged: (index){
                setState(() {
                  pageIndex = index;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              children: [
                SmoothPageIndicator(controller: pageVIewController, count: PageViewItems.length,effect: JumpingDotEffect(activeDotColor: Colors.blue.shade900),),
                Spacer(),
                FloatingActionButton(onPressed: (){
                  if(pageIndex != PageViewItems.length-1)
                    pageVIewController.nextPage(duration: Duration(milliseconds: 350), curve: Curves.ease,);
                  else {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));

                  }
                },child: Icon(Icons.arrow_forward_ios,size: 27,),backgroundColor: Colors.blue.shade900),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget pageViewItem(List<PageViewData> PageViewItems, index) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 30.0),
  child: Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          PageViewItems[index].image,
          width: 300,
          height: 300,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          PageViewItems[index].title,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          PageViewItems[index].statement,
          style: TextStyle(fontSize: 18, color: Colors.black26),
        ),
      ],
    ),
  ),
);