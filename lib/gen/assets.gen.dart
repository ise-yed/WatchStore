/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/png/avatar.png');

  /// File path: assets/png/banner.png
  AssetGenImage get banner => const AssetGenImage('assets/png/banner.png');

  /// File path: assets/png/main_logo.png
  AssetGenImage get mainLogo => const AssetGenImage('assets/png/main_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [avatar, banner, mainLogo];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/avatar.svg
  SvgGenImage get avatar => const SvgGenImage('assets/svg/avatar.svg');

  /// File path: assets/svg/back.svg
  SvgGenImage get back => const SvgGenImage('assets/svg/back.svg');

  /// File path: assets/svg/cancelled.svg
  SvgGenImage get cancelled => const SvgGenImage('assets/svg/cancelled.svg');

  /// File path: assets/svg/cart.svg
  SvgGenImage get cart => const SvgGenImage('assets/svg/cart.svg');

  /// File path: assets/svg/clasic.svg
  SvgGenImage get clasic => const SvgGenImage('assets/svg/clasic.svg');

  /// File path: assets/svg/close.svg
  SvgGenImage get close => const SvgGenImage('assets/svg/close.svg');

  /// File path: assets/svg/delete.svg
  SvgGenImage get delete => const SvgGenImage('assets/svg/delete.svg');

  /// File path: assets/svg/delivered.svg
  SvgGenImage get delivered => const SvgGenImage('assets/svg/delivered.svg');

  /// File path: assets/svg/desktop.svg
  SvgGenImage get desktop => const SvgGenImage('assets/svg/desktop.svg');

  /// File path: assets/svg/digital.svg
  SvgGenImage get digital => const SvgGenImage('assets/svg/digital.svg');

  /// File path: assets/svg/home.svg
  SvgGenImage get home => const SvgGenImage('assets/svg/home.svg');

  /// File path: assets/svg/in_proccess.svg
  SvgGenImage get inProccess => const SvgGenImage('assets/svg/in_proccess.svg');

  /// File path: assets/svg/left_arrow.svg
  SvgGenImage get leftArrow => const SvgGenImage('assets/svg/left_arrow.svg');

  /// File path: assets/svg/location.svg
  SvgGenImage get location => const SvgGenImage('assets/svg/location.svg');

  /// File path: assets/svg/minus.svg
  SvgGenImage get minus => const SvgGenImage('assets/svg/minus.svg');

  /// File path: assets/svg/phone.svg
  SvgGenImage get phone => const SvgGenImage('assets/svg/phone.svg');

  /// File path: assets/svg/plus.svg
  SvgGenImage get plus => const SvgGenImage('assets/svg/plus.svg');

  /// File path: assets/svg/postal_code.svg
  SvgGenImage get postalCode => const SvgGenImage('assets/svg/postal_code.svg');

  /// File path: assets/svg/search.svg
  SvgGenImage get search => const SvgGenImage('assets/svg/search.svg');

  /// File path: assets/svg/smart.svg
  SvgGenImage get smart => const SvgGenImage('assets/svg/smart.svg');

  /// File path: assets/svg/sort.svg
  SvgGenImage get sort => const SvgGenImage('assets/svg/sort.svg');

  /// File path: assets/svg/user.svg
  SvgGenImage get user => const SvgGenImage('assets/svg/user.svg');

  /// File path: assets/svg/user_menu.svg
  SvgGenImage get userMenu => const SvgGenImage('assets/svg/user_menu.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        avatar,
        back,
        cancelled,
        cart,
        clasic,
        close,
        delete,
        delivered,
        desktop,
        digital,
        home,
        inProccess,
        leftArrow,
        location,
        minus,
        phone,
        plus,
        postalCode,
        search,
        smart,
        sort,
        user,
        userMenu
      ];
}

class Assets {
  Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
