import 'package:shared_preferences/shared_preferences.dart';

List<String> datas =[


];

Future readData()async{
SharedPreferences pref= await SharedPreferences.getInstance();
datas=pref.getStringList("Key")??[];

}




addData()async{
  SharedPreferences pref= await SharedPreferences.getInstance();
  datas.add("""Write here""");
   await pref.setStringList("Key",datas);
}


saveData(int index,String newMLine)async{
  SharedPreferences pref= await SharedPreferences.getInstance();
  datas[index] = newMLine; 
   await pref.setStringList("Key",datas);
}                  



removeData(String mLine)async{
SharedPreferences pref= await SharedPreferences.getInstance();
datas.remove(mLine);
 await pref.setStringList("Key",datas);
readData();
}