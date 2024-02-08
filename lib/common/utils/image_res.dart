class ImageRes{
  ImageRes._(); //here we have created a private constructor so that anyone can't create constructor of this class when needed


  //icons for icons folder
    static const String _imageBase = "assets/icons";//here this approach is very important because we don't need to change everywhere from other files, only we need to change from here one time...because of the private variable anyone would not be able to access it easily and can't modify
    static const String defaultImage = '$_imageBase/home.png';
    static const String user = '$_imageBase/user.png';
    static const String people = '$_imageBase/people.png';
    static const String star = '$_imageBase/star.png';
    static const String lock = '$_imageBase/lock.png';
    static const String home = '$_imageBase/home.png';
    static const String search = '$_imageBase/search2.png';
    static const String play = '$_imageBase/play-circle.png';
    static const String message = '$_imageBase/message-circle.png';
    static const String person = '$_imageBase/person2.png';
    static const String searchIcon = '$_imageBase/search.png';
    static const String searchButton = '$_imageBase/options.png';
    static const String banner1 = '$_imageBase/Art.png';
    static const String banner2 = '$_imageBase/Image(1).png';
    static const String banner3 = '$_imageBase/Image(2).png';
    static const String menu = '$_imageBase/menu.png';

    //icons for images folder
    static const String _photoBase = "assets/images";
    static const String reading = "$_photoBase/reading.png";
    static const String man = "$_photoBase/man.png";
    static const String boy = "$_photoBase/boy.png";
}