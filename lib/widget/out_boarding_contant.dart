import 'package:flutter/material.dart';

import 'app_text.dart';
class OutBoardingContent extends StatelessWidget {
  const OutBoardingContent({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  });
  final String imageUrl;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(imageUrl),
          SizedBox(height: 33,),
          Text(title, style: TextStyle(
              fontFamily: 'Bahij_TheSansArabic-Black',
              fontSize: 22,
            color: Color(0xFF333333),fontWeight: FontWeight.w500,
          ),),
          SizedBox(height: 21,),
          Center(child:
          Container(
            height: 115,
              width: 340,
              child: Text(subTitle, style: TextStyle(
                fontFamily: 'Bahij_TheSansArabic-Black',
                fontSize: 14,
                color: Color(0xFF4B4B4B),fontWeight: FontWeight.w500,
              ),
    ),))
        ],
      ),
    );
  }
}

// Container(
// width: double.maxFinite,
// height: double.maxFinite,
// child: Stack(
// children: [
// Positioned(
// left: 0,
// right: 0,
// child: Container(
// width: double.maxFinite,
// height: 500,
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage(imageUrl),
// fit: BoxFit.cover
// )
// ),
// )),
// Positioned(
// top: 330,
// child: Container(
// padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
// width: MediaQuery.of(context).size.width,
// height: 500,
// decoration: const BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(30),
// topRight: Radius.circular(30)
// )
// ),
// child: Column(
// children: [
// Text(
// title,
// style: const TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold,
// color: Color(0xFF024775),
// ),
// ),
// const SizedBox(height: 16,),
// Text(
// subTitle,
// style: const TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold,
// color: Color(0xFF024775),
// ),
// ),
// ],
// ),
// )),
//
// ],
// ),
// ),