import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providors/task_provider.dart';
import 'package:todo/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  
 
   DialogBox({super.key,});

  @override
  Widget build(BuildContext context) {
    final TextEditingController taskText=new TextEditingController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
    content: Container(

      height: height*.20,
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
        
        
          Text("Add New Task",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        
          
      
          ),
          TextField(
            controller: taskText,
    
              decoration: InputDecoration(
                labelText: 'Task Title',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),)
        ,Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
MyButton(title: "Cancel", onPressed: (){

  Navigator.pop(context);
}),
SizedBox(width: width*.05,),
MyButton(title: "Add", onPressed: (){

  if(taskText.text.trim().isNotEmpty){
    Provider.of<TaskProvider>(context,listen: false).addTask(taskText.text.trim());
    taskText.clear();
   
    
    Navigator.pop(context);
  
    
   
  }
})

          ],
        )
        ],),
      ) ,
    ),
    );
  }
}