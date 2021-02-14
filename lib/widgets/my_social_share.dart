import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MySocialShare extends StatefulWidget {
  @override
  _MySocialShareState createState() => _MySocialShareState();
}

class _MySocialShareState extends State<MySocialShare> {
  bool _isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 450),
            curve: Curves.fastOutSlowIn,
            height: 48,
            width: _isOpen ? 240 : 48, // animate
            decoration:
                ShapeDecoration(shape: StadiumBorder(), color: Colors.black54),
          ),
          Container(
            height: 48,
            width: 48,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.black),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 450),
              firstChild: IconButton(
                icon: Icon(Icons.share, color: Colors.white,),
                onPressed: () => _toggleShare(),
              ),
              secondChild: IconButton(
                icon: Icon(Icons.close, color: Colors.white,),
                onPressed: () => _toggleShare(),
              ),
              crossFadeState:
                  !_isOpen ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 450),
            opacity: _isOpen ? 1 : 0,
            child: Container(
              width: 240,
              padding: const EdgeInsets.only(left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(AntDesign.twitter, color: Colors.white,),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon:Icon(AntDesign.facebook_square, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(AntDesign.instagram, color: Colors.white,),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  _toggleShare() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }
}
