import 'package:flutter/material.dart';
import 'package:google_drive_clone/models/file.dart';
import 'package:google_drive_clone/pages/home/subfolders.dart';
import 'package:google_drive_clone/pages/webview/webviewmedia.dart';
import 'package:google_drive_clone/urls.dart';
import '../../utils.dart';

class FileList extends StatefulWidget {
  FileList(this.file, {Key? key}) : super(key: key);
  FileModel file;
  @override
  State<FileList> createState() => _FileListState();
}

class _FileListState extends State<FileList> {
  bool isStared = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (widget.file.mimeType != "folder") {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => WebViewMedia(
                Urls.assetUrl + widget.file.fileName!,
              ),
            ),
          );
        }
        Navigator.of(context).push(
          MaterialPageRoute(builder: (ctx) => SubFolders(widget.file.id!, widget.file.fileName!)),
        );
      },
      leading: SizedBox(
        width: 60,
        height: 60,
        child: Image.asset(fileThubnail(widget.file.mimeType)),
      ),
      title: Text(widget.file.fileName!),
      trailing: GestureDetector(
        onTap: () {
          setState(() {
            isStared = !isStared;
          });
        },
        child: widget.file.mimeType != "folder"
            ? Icon(
                isStared ? Icons.star : Icons.star_border,
                color: Colors.amber,
              )
            : const SizedBox(),
      ),
    );
  }
}
