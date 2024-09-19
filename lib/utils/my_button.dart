import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
   MyButton({super.key, required this.title, required this.onPressed});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        
        height:height*.04 ,
        width: width*.18,
      decoration: BoxDecoration(
      
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10)
      ),
      
        child: Center(child: Text(widget.title,style: TextStyle(fontSize: 18),)),
      ),
    );
  }
}