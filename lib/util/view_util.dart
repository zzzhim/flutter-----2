import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:untitled/util/format_urli.dart';
import 'package:untitled/widget/navigation_bar.dart';

// 带缓存的image
Widget cachedImage(String url, {double? width, double? height}) {
  return CachedNetworkImage(
    imageUrl: url,
    width: width,
    height: height,
    fit: BoxFit.cover,
    placeholder: (
      BuildContext context,
      String url,
    ) {
      return Container(color: Colors.grey[200]);
    },
    errorWidget: (
      BuildContext context,
      String url,
      dynamic error,
    ) {
      return Icon(Icons.error);
    },
  );
}

// 黑色线性渐变
blackLinearGradient({bool fromTop = false}) {
  return LinearGradient(
    begin: fromTop ? Alignment.topCenter : Alignment.bottomCenter,
    end: !fromTop ? Alignment.topCenter : Alignment.bottomCenter,
    colors: [
      Colors.black54,
      Colors.black45,
      Colors.black38,
      Colors.black26,
      Colors.black12,
      Colors.transparent,
    ],
  );
}

// 修改状态栏
void changeStatusBar({
  color = Colors.white,
  StatusStyle statusStyle = StatusStyle.DARK_CONTENT,
}) async {
  // 沉浸式状态栏样式
  await FlutterStatusbarcolor.setStatusBarColor(
    statusStyle == StatusStyle.DARK_CONTENT ? Colors.black54 : Colors.white,
    animate: false,
  );
  await FlutterStatusbarcolor.setStatusBarWhiteForeground(
    statusStyle == StatusStyle.DARK_CONTENT,
  );
}

smallIconText(IconData iconData, var text) {
  var style = TextStyle(fontSize: 12, color: Colors.grey);

  if (text is int) {
    text = countFormat(text);
  }

  return [
    Icon(
      iconData,
      color: Colors.grey,
      size: 12,
    ),
    Text(
      ' $text',
      style: style,
    ),
  ];
}

// border线
borderLine(BuildContext context, {bool bottom = true, bool top = false}) {
  BorderSide borderSide = BorderSide(
    width: 0.5,
    color: Colors.grey.shade200,
  );
  return Border(
    bottom: bottom ? borderSide : BorderSide.none,
    top: top ? borderSide : BorderSide.none,
  );
}

// 间距
SizedBox hiSpace({double height: 1, double width: 1}) {
  return SizedBox(
    height: height,
    width: width,
  );
}
