import 'package:flutter/material.dart';

class MyAdressScreen extends StatefulWidget {
  static const String id = 'myAdressScreen';
  @override
  _MyAdressScreenState createState() => _MyAdressScreenState();
}

class _MyAdressScreenState extends State<MyAdressScreen> {
  List<String> adresses = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: new AppBar(
        title: Text("MyAdress Screen"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: adresses.length,
        itemBuilder: (BuildContext context, int index) {
          return adresses.isEmpty
              ? null
              : ListTile(
                  onLongPress: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Remove Adress'),
                        content: const Text('Do you want to remove the adress'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {});
                              adresses.removeAt(index);
                              Navigator.pop(context);
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    );
                  },
                  tileColor: Colors.white,
                  leading: Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Ev',
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(' ${adresses[index]}'),
                  trailing: Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Colors.grey,
                    size: 30,
                  ),
                );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 5,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {});
          adresses.add('Yeni adres');
        },
        label: const Text('Add new adress'),
        icon: const Icon(Icons.add_circle_outline),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
} //some problems gonna fix
