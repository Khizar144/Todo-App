import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  final bool isCompleted;
  final void Function(bool?) onPressed;
  final String taskName;
  final VoidCallback OnDelete;

  const TaskTile({
    super.key,
    required this.isCompleted,
    required this.onPressed,
    required this.taskName, required this.OnDelete,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Card(
        elevation: 3,
        child: Container(
          height: h * 0.08,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items
            children: [
              Row(
                children: [
                  Checkbox(
                    hoverColor: Colors.black,
                    activeColor: Colors.black,
                    value: widget.isCompleted,
                    onChanged: (value) {
                      widget.onPressed(value);
                    },
                  ),
                  Text(
                    widget.taskName,
                    style:  TextStyle(fontSize: 18,decoration: 
                    
                    widget.isCompleted?TextDecoration.lineThrough:TextDecoration.none
                    
                    
                    
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  widget.OnDelete();
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
