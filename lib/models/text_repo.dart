class TextRepo {
  final String cameraSource;
  final String gallerySource;
  final String replyPlaceholder;
  final String slideToSee;
  final String seconds;
  final String minutes;
  final String hours;
  final String days;

  TextRepo({
    this.cameraSource = "Camera",
    this.gallerySource = "Gallery",
    this.replyPlaceholder = "Message...",
    this.slideToSee = "Slide to see...",
    this.seconds = "s",
    this.minutes = "m",
    this.hours = "h",
    this.days = "d",
  });
}
