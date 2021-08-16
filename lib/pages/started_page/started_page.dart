import 'dart:ui';
import 'package:easy_hire/models/slide.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:easy_hire/widgets/slide_dots.dart';
import 'package:easy_hire/widgets/slide_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../signin_page/signin_page.dart';
import '../signup_page/signup_page.dart';

class StartedPage extends StatefulWidget {
  @override
  _StartedPageState createState() => _StartedPageState();
}

class _StartedPageState extends State<StartedPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    // Timer.periodic(Duration(seconds: 3), (Timer timer) {
    //   _currentPage = (_currentPage + 1) % slideList.length;
    //
    //   _pageController.animateToPage(
    //     _currentPage,
    //     duration: Duration(milliseconds: 300),
    //     curve: Curves.easeIn,
    //   );
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.luminosity),
            fit: BoxFit.cover,
            image: AssetImage('assets/images/image1.jpg'),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    PageView.builder(
                      physics: ScrollPhysics(
                        parent: BouncingScrollPhysics(),
                      ),
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: slideList.length,
                      itemBuilder: (ctx, i) => SlideItem(i),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 35),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for (int i = 0; i < slideList.length; i++)
                                if (i == _currentPage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 130,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  CustomButton(
                    title: 'Log In',
                    isActive: true,
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LogInPage()));
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FlatButton(
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.montserrat(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.41,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.white,
                          width: 2,
                          style: BorderStyle.solid),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUpPage()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
