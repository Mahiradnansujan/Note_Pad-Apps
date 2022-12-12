import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notepadapps/accessories.dart';

import 'home.dart';

class NotePad extends StatefulWidget {
   String mLine;
   int index;
   NotePad({super.key,required this.mLine,required this.index});

  @override
  State<NotePad> createState() => _NotePadState();
}

class _NotePadState extends State<NotePad> {
  String _text="";
  TextEditingController _controller=TextEditingController();

  @override
  void initState() {
  _controller=TextEditingController(text: widget.mLine);
  _text=widget.mLine;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
        MaterialButton(onPressed: (){
          setState(() {
             saveData(widget.index, _text);
          });
         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Home()),
          (route) => false);
        }, 
        child: Text("Save"))],
      ),
      body: Container(
        
        width: double.infinity,
        
        color: Colors.green,
        
        child: TextField(
          style: TextStyle(fontSize: 25.0, height: 2.0, color: Colors.black),
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            
            
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(50.0)
          ),
          onChanged: (String val) {
            setState(() {
              _text = val;
            });
          },
          controller: _controller,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          
        ),
      ),

    );
  }
}
