import 'package:flutter/material.dart';

class CreateExpense extends StatefulWidget {
  @override
  CreateExpenseState createState() {
    return new CreateExpenseState();
  }
}

class CreateExpenseState extends State<CreateExpense> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Expense"),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Save"
            ),



          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 1.8,
          width: MediaQuery.of(context).size.width,

          child: Column(
            children: <Widget>[

              Card(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                   // createExpenseCard(),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            //Top Row With User Info and payment type
                            expenseInfo(),
                            //expForm(merchantController,  totalController, fileContent),

                            Text(
                              "Wowo"
                            ),

                            Text(
                              "Wowowwwww"
                            )

                          ],
                        ),
                      ),
                    //expenseForm(),
                  ],
                ),
              ),
            ],
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
        //expForm(merchantController,  totalController),
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


Widget expForm(TextEditingController mc, TextEditingController tc, Map<String, dynamic> fc)
{
  print(mc);
  return Form(
   // padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
         TextFormField(
           controller: mc,
          decoration: const InputDecoration(
            icon: Icon(
              Icons.store
            ),
            hintText: 'Enter Merchant Name',
            labelText: 'Merchant',
          ),

          validator: (val) => val.isEmpty ? 'Name is required' : null,
         // onSaved: (val) => newContact.name = val,
        ),

         new Row(children: <Widget>[
           new Expanded(
               child: new TextFormField(
                 decoration: new InputDecoration(
                   icon: const Icon(Icons.calendar_today),
                  // hintText: 'Enter your date of birth',
                   labelText: 'Date',
                 ),
                 //controller: _controller,
                 keyboardType: TextInputType.datetime,
                 //validator: (val) =>
              //   isValidDob(val) ? null : 'Not a valid date',
               //  onSaved: (val) => newContact.dob = convertToDate(val),
               ),
           ),
           new IconButton(
             icon: new Icon(Icons.more_horiz),
             tooltip: 'Choose date',
             onPressed: (() {
           //    _chooseDate(context, _controller.text);
             }),
           )
         ]),

         Row(

           children: <Widget>[

             Expanded(
               flex: 1,
               child: TextFormField(
                 decoration: InputDecoration(
                   hintText: "NGN",
                   icon: Icon(
                       Icons.attach_money
                   ),
                 ),
               ),
             ),

             Expanded(
               flex: 3,
               child: TextFormField(
                 controller: mc,

                 decoration: InputDecoration(
                   icon: Icon(
                     Icons.note
                   ),
                   hintText: "N0.00",
                 ),
               ),
             )
           ],
         ),

         TextField(
           decoration: InputDecoration(
             icon: Icon(
                 Icons.comment
             ),
             hintText: "Comment",
           ),
           controller: tc,
         ),


        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            fc.toString()
          ),
        )
     ],
    ),
  );
}