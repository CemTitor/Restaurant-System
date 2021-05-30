import 'package:flutter/material.dart';
import 'package:restaurant_system/animations/fade_animation.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = 'profileScreen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 450,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/emma.jpg'), //TODO kullanıcı resmi
                            fit: BoxFit.cover)),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black,
                            Colors.black.withOpacity(.3)
                          ])),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FadeAnimation(
                                1,
                                Text(
                                  "kullanıcı ismi",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                FadeAnimation(
                                    1.2,
                                    Text(
                                      "Kullanıcı puanı",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    )),
                                SizedBox(
                                  width: 50,
                                ),
                                FadeAnimation(
                                    1.3,
                                    Text(
                                      "Muhtar Adayı",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 16),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FadeAnimation(
                          1.6,
                          Column(
                            children: [
                              ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                tileColor: Colors.white,
                                title: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.center,
                                  // onChanged: (value) {
                                  //   null
                                  // },
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                  ).copyWith(),
                                ),
                              ),
                              ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                tileColor: Colors.white,
                                title: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.center,
                                  // onChanged: (value) {
                                  //   null
                                  // },
                                  decoration: InputDecoration(
                                    labelText: 'Surname',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ).copyWith(),
                                ),
                              ),
                              ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                tileColor: Colors.white,
                                title: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  textAlign: TextAlign.center,
                                  // onChanged: (value) {
                                  //   null
                                  // },
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ).copyWith(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "Born",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                            1.6,
                            Text(
                              "April, 15th 1990, Paris, France",
                              style: TextStyle(color: Colors.grey),
                            )),
                        SizedBox(
                          height: 120,
                        )
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
          Positioned.fill(
            bottom: 50,
            child: Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FadeAnimation(
                  2,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.green),
                    child: Align(
                        child: Text(
                      "GÜNCELLE",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget makeVideo({image}) {
    return AspectRatio(
      aspectRatio: 1.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.3)
          ])),
          child: Align(
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 70,
            ),
          ),
        ),
      ),
    );
  }
}
