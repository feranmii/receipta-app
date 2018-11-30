import 'package:flutter/material.dart';
class FirstFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      height: 400.0,
      width: MediaQuery.of(context).size.width,
      child: Card(
          color: Colors.white,
          child: enterUserData()
          ),
    );
  }
}

Widget enterUserData()
{
  return Container(
    height: 100.0,
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          //Top Row of the Reg Data
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //First Elements on the left
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    child: Icon(
                      Icons.adb
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("System.Admin", style: TextStyle(color: Colors.black),),
                  )
                ],
              ),

              Icon(
                Icons.arrow_drop_up,
                color: Colors.teal,

              )

            ],
          ),

          //Main Section
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Column(
              children: <Widget>[
                Text("Hey there @user-kun, why don't you take a minute to complete your registration :)", style: TextStyle(color: Colors.black),),
                Padding(
                  padding: const EdgeInsets.only(top:40.0),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 60.0,
                    ),


                  ),
                )
              ],
            ),
          )

        ],
      ),
  );
}
