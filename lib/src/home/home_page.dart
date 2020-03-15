import 'package:flutter/material.dart';
import 'package:flutter_piaui_app/src/home/widgets/card.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Meetings',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              child: Icon(Icons.verified_user),
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 2),
                child: Text(
                  'Today, july 8',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
              CustomCard(),
            ],
          ),
          CustomCard(),
          CustomCard(),
          CustomCard(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Icon(
                Icons.border_all,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Icon(
                Icons.event_note,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
