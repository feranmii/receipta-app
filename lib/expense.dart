//class Expense{
//  String merchant;
//  //TODO: Change this later to DateTime
//  String date;
//  String currency;
//  String total;
//  String comment;
//
//  Expense(this.merchant, this.comment);
//
//  Expense.fromJson(Map<String, dynamic> json):
//     merchant = json['merchant'],
//    comment = json['comment'];
//
//  Map<String, dynamic> toJson() =>
//      {
//        'merchant': merchant,
//        'comment':comment,
//      };
//
//
//}


class Expense {
  final int id;
  final String merchant;
  final ExpenseDetail amount;

  Expense(this.id, this.merchant,this.amount);
}

class ExpenseDetail {
  final List<CashDetail> cash;

  const ExpenseDetail(this.cash);
}

class CashDetail {
  final int amount;
  final String currency;

  const CashDetail(this.amount, this.currency);
}
