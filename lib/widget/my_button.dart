import 'package:flutter/material.dart';
import 'app_text.dart';

class MyButton extends StatefulWidget {
  final Function() onPressed;
  final String text;
  final bool? loading;

  const MyButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.loading,
  }) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isLoading = false;

  void setLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
    gradient: LinearGradient(
          begin: AlignmentDirectional.topEnd,
          end: AlignmentDirectional.bottomStart,
          colors: [
            Color(0xFF5CBA97),
            Color(0xFF368EC8),
          ],
        ),
      ),
      child: ElevatedButton(
        onPressed: () async {
          setLoading(true);
          await Future.delayed(const Duration(seconds: 1));
          setLoading(false);
          widget.onPressed();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
         // minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (_isLoading)
              SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            if (!_isLoading)
              AppText(
                text: widget.text,
                fontFamily: 'Bahij_TheSansArabic-Black',
                color: Colors.white,
                size: 18,
                fontWeight: FontWeight.w500,
              ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// import 'app_text.dart';
// class MyButton extends StatefulWidget {
//   final Function() onPressed;
//   final String text;
//   final bool? loading;
//   const MyButton({
//     super.key,
//     required this.onPressed,
//     required this.text,
//      this.loading,
//   });
//
//   @override
//   State<MyButton> createState() => _MyButtonState();
// }
//
// class _MyButtonState extends State<MyButton> {
//   bool _isLoading =false;
//   void setLoading(bool value){
//     setState(() {
//       _isLoading = value;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 320,
//       height: 50,
//       alignment: AlignmentDirectional.center,
//       decoration:  BoxDecoration(
//         borderRadius: BorderRadius.circular(100),
//         gradient: LinearGradient(
//           begin: AlignmentDirectional.topEnd,
//           end: AlignmentDirectional.bottomStart,
//           colors: [
//             Color(0xFF5CBA97),
//             Color(0xFF368EC8),
//           ],
//         ),
//       ),
//
//       child: ElevatedButton(
//        // clipBehavior: Clip.antiAlias,
//         onPressed:()async{
//           setLoading(true);
//           await Future.delayed(const Duration(seconds: 1));
//           setLoading(false);
//           widget.onPressed();
//           },
//         style:  ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//          // minimumSize: Size(double.infinity, 50),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(100),
//           ),
//         ),
//         child: _isLoading ? const SizedBox(height: 15,width: 15) :
//         Material(
//           color: Colors.transparent,
//           child: AppText(
//             text: widget.text, fontFamily: 'Bahij_TheSansArabic-Black',
//             color: Colors.white,size: 18,fontWeight: FontWeight.w500,),
//         ),
//       ),
//     );
//   }
// }