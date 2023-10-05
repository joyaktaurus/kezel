import 'dart:ui';

abstract class AssetHelper {
   static String images(String imageName) {
     return 'assets/png/$imageName';
   }

   static get foodimage => images("img.png");

}
