import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/card.dart';
import 'dart:convert';
import '../helpers/card_colors.dart';

class CardListBloc {
  BehaviorSubject<List<CreditCard>> _cardsCollection = BehaviorSubject<List<CreditCard>>();

  
  List<CreditCard> _cardResults;

  //Retrieve data from Stream
  Stream<List<CreditCard>> get cardList => _cardsCollection.stream;

  CardListBloc() {
    initialData();
  }

  void initialData() async {
    var initialData = await rootBundle.loadString('data/initialData.json');
    var decodedJson = jsonDecode(initialData);

    _cardResults = CardModel.fromJson(decodedJson).results;
    
    for(var i = 0; i < _cardResults.length; i++) {
      _cardResults[i].cardColor = CardColor.baseColors[i];
    }

    _cardsCollection.sink.add(_cardResults);
  }

  void dispose() {
    _cardsCollection.close();
  }
}

final cardListBloc = CardListBloc();