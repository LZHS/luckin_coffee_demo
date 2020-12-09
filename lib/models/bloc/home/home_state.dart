part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {
  // ignore: non_constant_identifier_names
  static final DEFAULT_BANNER_BG =
      "lib/assets/images/banners/icon_banner02.webp";
  // ignore: non_constant_identifier_names
  static final DEFAULT_BOTTOM_BANNER_BG =
      "lib/assets/images/home/bottom_bar.webp";

  final menuItemData = [
    {
      "id": 0,
      "title": "现在下单",
      "subTitles": "ORDER NOW",
      "icon": "lib/assets/images/home/icon_coffee_cup.png"
    },
    {
      "id": 1,
      "title": "咖啡钱包",
      "subTitles": "COFFRR WALLET",
      "icon": "lib/assets/images/home/icon_coffee_wallet.png"
    },
    {
      "id": 2,
      "title": "送Ta咖啡",
      "subTitles": "SEND COFFEE",
      "icon": "lib/assets/images/home/icon_coffee_gift.png"
    },
    {
      "id": 3,
      "title": "企业账户",
      "subTitles": "SENTERPRISE ACCOUNT",
      "icon": "lib/assets/images/home/icon_coffee_account.png"
    },
  ];
}

// ignore: camel_case_types
class LocatingRefresh extends HomeState {
  final LocatingInformation locatingInformation;

  LocatingRefresh(this.locatingInformation);
}

class RefreshMenuBottom extends HomeState {
  // ignore: non_constant_identifier_names
  static final DEFAULT_BOTTOM_BANNER_BG =
      "lib/assets/images/home/bottom_bar.webp";
}

// ignore: must_be_immutable
class RefreshBanner extends HomeState {
  // ignore: non_constant_identifier_names
  static final DEFAULT_BANNER_BG =
      "lib/assets/images/banners/icon_banner01.webp";
  BannerStateEnum status = BannerStateEnum.NO_BANNER_DATA;
  List<BannerItem> banners;


}
enum BannerStateEnum {
  NO_BANNER_DATA,
  SHOW_BANNER_DATA
}