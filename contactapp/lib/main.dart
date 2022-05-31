import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home: const Contact(),
    );
  }
}

class Contact extends StatefulWidget {
  const Contact({ Key? key }) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}


    
 
  class _ContactState extends State<Contact> {
    
 List<String> name = [];
 List<String>phone_num = [];

 String _name = '';
 String _phone = '';


    final namecon = TextEditingController();
    final contactcon  = TextEditingController();
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact App"),
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (c, index) {
        return ListTile(
          title: Text(name[index]),
          subtitle: Text(phone_num[index]),
        );
      },),
      floatingActionButton: FloatingActionButton( 
        
        onPressed: () {
        showDialog(context: context, builder: (c){
          return AlertDialog(
            title: Text("add new contact"),
            content:Container(
              padding: EdgeInsets.zero,
              height: 200,
              child: Column(
                children: [
                  TextField(
                    controller: namecon,
                    decoration: InputDecoration(
                      labelText: "Enter Contact Name"
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  TextField(
                    controller: contactcon,
                    decoration: InputDecoration(
                      labelText: "Enter your number"
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    setState(() {
_name = namecon.text;
_phone = contactcon.text;
                      name.add(_name);
                      phone_num.add(_phone);
                      
                       Navigator.of(context).pop();
                       namecon.clear();
                       contactcon.clear();
                      }
                       
                      );
                    },
                    child: Text("Add"),),
                    
                   
                  
                   
                ],
              ),
            ) ,
          );
        });
      },
      child: Icon(Icons.add),
      ),
    );
  }
}
