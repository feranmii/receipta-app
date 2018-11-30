import 'package:flutter/material.dart';
class SecondFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,


      child: ListView.builder(
        itemCount: 10,
        padding: EdgeInsets.all(12.0),

          itemBuilder: (context, index)
              {
                return expenseCard("209321" + index.toString(), index + 1, 20000);

              }
      ),
    );
  }
}

Widget expenseList()
{

}

Widget expenseCard(String expenseId, int expenseNo, int expenseAmount)
{
  return Card(

    color: Colors.white,
    child: Container(
      height: 100.0,
      width: 100.0,
      child: Row(
        children: <Widget>[
          //Left side of the card for image
          Container(
            width: 70.0,
            decoration: BoxDecoration(color: Colors.grey[100]),
            child: Center(
              child: Stack(
                children: <Widget>[
                  Icon(
                    Icons.receipt,
                    size: 40.0,
                    color: Colors.grey,
                  ),

                  Icon(
                    Icons.add_box,
                    size: 20.0,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ),

          //Middle Info
          Container(
            padding: EdgeInsets.only(top: 4.0),
            width: 150.0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //Top
                Text(
                  "User's Expense #" + expenseId,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0

                  ),
                ),

                Container(
                  height: 40.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        expenseNo.toString(),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0

                        ),
                      ),

                      Text(
                        expenseAmount.toString(),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0

                        ),
                      ),


                    ],
                  ),
                )

              ],
            ),
          )

        ],
      ),
    ),
  );
}