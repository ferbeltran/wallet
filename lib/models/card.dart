import 'package:flutter/material.dart';

class CardModel {
  List<CreditCard> results;

  CardModel({this.results});

  CardModel.fromJson(Map<String, dynamic> json) {
    if (json['cardResults'] != null) {
      results = new List<CreditCard>();
      json["cardResults"].forEach((r) {
        results.add(new CreditCard.fromJson(r));
      });
    }
  }
}

class CreditCard{
  String cardHolderName;
  String cardNumber;
  String cardMonth;
  String cardYear;
  String cardCvv;
  Color cardColor;
  String cardType;

  CreditCard({this.cardHolderName, this.cardNumber, this.cardMonth, this.cardYear,
        this.cardCvv, this.cardColor, this.cardType});


  CreditCard.fromJson(Map<String, dynamic> json) {
    cardHolderName = json["cardHolderName"];
    cardNumber = json["cardNumber"];
    cardMonth = json["cardMonth"];
    cardYear = json["cardYear"];
    cardCvv = json["cardCvv"];
    cardColor = json["cardColor"];
    cardType = json["cardType"];
  }

}
