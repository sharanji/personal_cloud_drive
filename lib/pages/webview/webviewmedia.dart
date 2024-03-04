import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_file_view/flutter_file_view.dart';

class WebViewMedia extends StatefulWidget {
  WebViewMedia(this.url, {Key? key}) : super(key: key);
  String url;

  @override
  State<WebViewMedia> createState() => _WebViewMediaState();
}

class _WebViewMediaState extends State<WebViewMedia> {
  @override
  void initState() {
    FlutterFileView.init();
    super.initState();
  }

  // #docregion webview_widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(
          //   widget.url,
          //   style: TextStyle(fontSize: 10),
          // ),
          ),
      body: FileView(
        controller: FileViewController.network(widget.url),
      ),
    );
  }
  // #enddocregion webview_widget
}
