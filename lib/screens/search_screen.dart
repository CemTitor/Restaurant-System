import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _formKey=GlobalKey<FormState>();
  var _autoValidate=false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Search Screen"),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: Column(children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Enter Search',
                  border:OutlineInputBorder(),
                  filled: true,
                  errorStyle: TextStyle(fontSize: 15),
                ),
                validator: (value) {
                  if(value.isEmpty){
                    return 'Please Enter a Food';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child:  RawMaterialButton(onPressed: () {
                  final isValid = _formKey.currentState.validate();
                  if(isValid){
                    //TO DO PERFORM SEARCH
                  }else{
                  //TO DO Set autovalidate=true
                    setState(() {
                      _autoValidate = true;
                    });
    }
                },
                  fillColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child:Text('Search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              ),
      ],
    ),
        )
        ],
      ),
    ),
    );
  }
}
