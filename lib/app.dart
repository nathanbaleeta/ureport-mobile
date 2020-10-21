import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ureport_app/navigation/UReportAppBar.dart';
import 'package:ureport_app/stories/StoryListView.dart';


class TabScreen extends StatefulWidget {
  TabScreen({Key key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Text('Polls'),
    StoryListView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.equalizer),
            title: Text('Poll',
              style: Theme.of(context).primaryTextTheme.subtitle2,),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Stories',
              style: Theme.of(context).primaryTextTheme.subtitle2,)
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _onItemTapped,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
        UReportAppBar(),
        SliverFillRemaining(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        ],
      ),
    );
  }
}
