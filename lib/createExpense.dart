import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


import 'package:intl/intl.dart';class CreateExpense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Expense"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 1.8,
          width: MediaQuery.of(context).size.width,
          child: Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                createExpenseCard(),
                //expenseForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget createExpenseCard() {
  return Container(
    padding: EdgeInsets.all(10.0),
    child: Column(
      children: <Widget>[
        //Top Row With User Info and payment type
        expenseInfo(),
        expForm(),
      ],
    ),
  );
}

Widget expenseInfo() {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      //Row that holds the user image and mail
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            child: Icon(
              Icons.account_box,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "example@email.com",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      //Cash Icon
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(Icons.attach_money, color: Colors.grey),
          Text(
            "Cash",
            style: TextStyle(color: Colors.black54),
          )
        ],
      )
    ],
  );
}

Widget expenseForm() {
  final dateFormat = DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(
          "Merchant",
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              width: 260.0,
              padding: EdgeInsets.all(5.0),
              child: TextField(

                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0

                ),

                decoration: new InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
              ),
            ),
            Container(
              height: 60.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: Colors.grey[100]),
              child: Icon(
                Icons.assignment,
                color: Colors.teal[100],
                size: 35.0,
              ),
            )
          ],
        ),

        DateTimePickerFormField(
          format: dateFormat,
          style: TextStyle(
            color: Colors.black54
          ),
          decoration: InputDecoration(labelText: "Data", labelStyle: TextStyle(
            color: Colors.black54
          )),

        ),

        Text(
          "Date",
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        //Second Row
        Row(
          children: <Widget>[
            Container(
              width: 260.0,
              padding: EdgeInsets.all(5.0),
              child: TextField(
                style: TextStyle(
                    color: Colors.black
                ),

                decoration: new InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:
                    const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                ),
              ),
            ),
          ],
        )


      ],
    ),
  );
}

Widget expForm()
{
  return Form(
   // padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      children: <Widget>[
        new TextFormField(
          decoration: const InputDecoration(
            hintText: 'Enter your first and last name',
            labelText: 'Merchant',
          ),

          validator: (val) => val.isEmpty ? 'Name is required' : null,
         // onSaved: (val) => newContact.name = val,
        ),
     ],
    ),
  );
}