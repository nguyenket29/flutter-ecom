import 'package:flutter/services.dart' as the_bundle;

import '../models/sneaker_model.dart';

class Helper {
  Future<List<Sneakers>> getMaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final maleList = sneakersFromJson(data);
    return maleList;
  }

  Future<List<Sneakers>> getFemaleSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");
    final femaleList = sneakersFromJson(data);
    return femaleList;
  }

  Future<List<Sneakers>> getKidSneakers() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");
    final kidList = sneakersFromJson(data);
    return kidList;
  }

  Future<Sneakers> getMaleSneakerById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");
    final maleList = sneakersFromJson(data);
    final sneakers = maleList.firstWhere((element) => element.id == id);
    return sneakers;
  }

  Future<Sneakers> getFemaleSneakerById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/women_shoes.json");
    final maleList = sneakersFromJson(data);
    final sneakers = maleList.firstWhere((element) => element.id == id);
    return sneakers;
  }

  Future<Sneakers> getKidSneakerById(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");
    final maleList = sneakersFromJson(data);
    final sneakers = maleList.firstWhere((element) => element.id == id);
    return sneakers;
  }
}
