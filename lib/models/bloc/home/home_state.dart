part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {
  // ignore: non_constant_identifier_names
  final default_banner_bg = "lib/assets/images/banners/icon_banner02.webp";

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
  final String bottomBarPath = "lib/assets/images/home/bottom_bar.png";
}

class RefreshBanner extends HomeState {
  final List<BannerItem> banners;

  RefreshBanner(this.banners);
}
