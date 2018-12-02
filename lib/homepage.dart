import 'package:flutter/material.dart';
import 'firstPage.dart';
import 'secondPage.dart';
import 'thirdPage.dart';
import 'routes.dart';

class DrawerItem{
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);

}



class HomePage extends StatefulWidget {

  var navDetails = <DrawerItem>[
    new DrawerItem("Home", Icons.inbox),
    new DrawerItem("My Expenses", Icons.description),
    new DrawerItem("Report", Icons.assignment),
    new DrawerItem("Settings", Icons.settings),
    new DrawerItem("About", Icons.info),
  ];

  var navItems = <BottomNavigationBarItem>[
    new BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
    new BottomNavigationBarItem(icon: Icon(Icons.description), title: Text("Expenses")),
    new BottomNavigationBarItem(icon: Icon(Icons.assignment), title: Text("Report")),
    new BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("Settings")),

  ];


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  _getNavItemWidget(int pos)
  {
    switch(pos)
    {
      case 0:
        return FirstFragment();
        break;
      case 1:
        return SecondFragment();
        break;
      case 2:
        return ThirdFragment();
        break;
      case 3:
        return ThirdFragment();
        break;
      case 4:
        return ThirdFragment();
        break;
      case 5:
        return ThirdFragment();
        break;

      default:
        return new Text("Errorr");
    }

  }

  onItemTapped(int index)
  {
    setState(
        ()=> selectedIndex = index
         // close the drawer
    );

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        //here we display the corresponding fragment
        //we can instead choose to have a static title
        title: Text(widget.navDetails[selectedIndex].title),

        //centerTitle: true,
        actions: <Widget>[
          IconButton(
            iconSize: 30.0,
            icon: Icon(
              Icons.add,
              color: Colors.teal,
            ),

            onPressed: (){
              newTaskModalBottomSheet(context);
            },


          )
        ],


      ),



      bottomNavigationBar: BottomNavigationBar(
        items: widget.navItems,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        fixedColor: Colors.teal,
      ),
      body: _getNavItemWidget(selectedIndex),
    );
  }
}

void newTaskModalBottomSheet(context)
{
  var p  = Pages();

  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc)
      {
        return Container(
          child: Wrap(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  "LOG EXPENSE",
                  style: TextStyle(
                    color: Colors.grey[150],


                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.create, color: Colors.teal,),
                title: Text("Manually Create"),

                onTap: ()=> Navigator.pushNamed(context, p.createExpense),

              ),
              ListTile(
                leading: Icon(Icons.scanner, color: Colors.teal,),
                title: Text("Scan Receipt"),
                onTap: ()=> {},
              ),

            ],
          ),
        );
      }
  );
}
