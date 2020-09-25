part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

/// 请求 数据 动作
class RequestData extends HomeEvent {}
/// 刷新 菜单区域
class RefreshMenu extends HomeEvent{}
/// 刷新 最近 店铺信息位置
class RefreshLocating extends HomeEvent{}