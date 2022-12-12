import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notepadapps/note_pad.dart';

import 'accessories.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  Future deleteDialog(BuildContext context, String mLine){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Warning"),
        content: Text("Do You want to Delete this notes"),
        actions: [
          TextButton(
            onPressed: (){
              setState(() {
                removeData(mLine);
              });
              
            Navigator.of(context).pop();
          }, 
          child: Text("Yes")),
           TextButton(
            onPressed: (){
            Navigator.of(context).pop();
          }, 
          child: Text("No")),
        ],
      );
    } );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
        body: FutureBuilder(
          future: readData(),
          builder: (context, snapshot) {
            return CustomScrollView(
              slivers: [
                SliverGrid.count(crossAxisCount: 2, 
                children: [
                  ...datas
                  .map((mLine){ 
                    int index=datas.lastIndexWhere((element) =>element== mLine);
                    return InkWell(
                    onLongPress: (){
                      deleteDialog(context, mLine);
                    },
                  onTap: (){ 
        
                    Navigator.push(
                      context, MaterialPageRoute(builder:(context)=>NotePad(
                        mLine: mLine,index: index,
                        )));
                  },
                   child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(
                      color: Colors.black87,
                      offset: Offset(8, 8),
                      blurRadius: 15
                    )
                    ],
                    ),
                    child: Text(mLine)),
                   );})
                   .toList(),
        
                 InkWell(
                  onTap: (){
                    setState(() {
                      addData();
                    });
                  },
                   child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(
                      color: Colors.black87,
                      offset: Offset(8, 8),
                      blurRadius: 15
                    )
                    ],
                    ),
                    child: Icon(Icons.add,size: 40,),
                   ),
                 ),
                ],
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}