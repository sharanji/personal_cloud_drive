String fileThubnail(mime) {
  switch (mime) {
    case "png":
      return "assets/gallery.png";
    case "jpg":
      return "assets/gallery.png";
    case "mp3":
      return "assets/music.png";
    case "mp4":
      return "assets/video.png";
    case "pdf":
      return "assets/pdf.png";
    case "xlsx":
      return "assets/excel.png";
    case "csv":
      return "assets/csv.png";
    case "doc":
      return "assets/doc.png";
    case 'folder':
      return "assets/folder.png";
    default:
      return "assets/unknown.png";
  }
}
