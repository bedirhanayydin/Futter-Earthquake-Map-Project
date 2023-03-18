class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();
  String get filter_marker => toSvg('map/filter_marker');
  String get map_marker => toSvg('map/map-marker');

  String get icn_warning => toSvg('icn-warning');
  String get splash_1 => toPng('splash/1');
  String get splash_2 => toPng('splash/2');
  String get splash_3 => toPng('splash/3');
  String toPng(String name) => 'assets/image/$name.png';
  String toJPG(String name) => 'assets/image/$name.jpg';
  String toSvg(String name) => 'assets/svg/$name.svg';
}
