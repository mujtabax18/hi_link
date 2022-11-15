import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  static String id='HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    double partHeight=3.5;
    return SafeArea(
      child: Scaffold(
        backgroundColor:Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              height: mediaQuery.height/partHeight,
              child: Image.asset('images/home.png',
              width: double.infinity,
              height: double.infinity,),
            ),
            TwoButtons(mediaQuery: mediaQuery,
                partHeight: partHeight,
            btn1Image: 'images/btn1.jpg',btn1String: 'https://us05web.zoom.us/j/4297766635?pwd=cUtPNklDNHEwd0pnOWJYRTNDbGZRZz09',
              btn2Image: 'images/btn2.jpg', btn2String: 'https://www.youtube.com/channel/UCRGySZMGhOdUmXdkbxYUGXQ/featured',
            ),
            TwoButtons(mediaQuery: mediaQuery,
              partHeight: partHeight,
              btn1Image: 'images/btn3.jpg',btn1String: 'http://pf.kakao.com/_URXXxj',
              btn2Image: 'images/btn4.jpg', btn2String: 'https://forms.gle/oUAqQzeZRprWjRtLA',
            ),

          ],
        ),
      ),
    );
  }
}

class TwoButtons extends StatelessWidget {
  const TwoButtons({
    Key? key,
    required this.mediaQuery,
    required this.partHeight,
    required this.btn1String,
    required this.btn1Image,
    required this.btn2Image,
    required this.btn2String,
  }) : super(key: key);

  final Size mediaQuery;
  final double partHeight;
  final String btn1Image;
  final String btn1String;
  final String btn2Image;
  final String btn2String;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: mediaQuery.height/partHeight,
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(mediaQuery: mediaQuery,
          image: btn1Image,
            toLaunch: btn1String,
          ),
          CustomButton(mediaQuery: mediaQuery,
            image: btn2Image,
            toLaunch: btn2String,
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.mediaQuery,
    required this.image,
    required this.toLaunch,
  }) : super(key: key);

  final String toLaunch;
  final String image;
  final Size mediaQuery;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: ()async{
         await _launchInBrowser(Uri.parse(toLaunch));
    },
        child: Image.asset(image,
          width: mediaQuery.width/2.5,
        )
    );
  }
}



Future<void> _launchInBrowser(Uri url) async {
  try{
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  catch(e){
    print(e.toString());
  }
}