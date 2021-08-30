# Flutter Animations

## Implicit Animations:
> With implicit animations, you can animate a widget property by setting a target value; whenever that target value changes, the widget animates the property from the old value to the new one. In this way, implicit animations trade control for convenience—they manage animation effects so that you don’t have to.

- Easy to use but less control.
- Target value derives the animation.

### Interpolation:
> The process of animating through the values between old and new value is called interpolation.

- In simple terms - the process of values between old and new value is called interpolation.
- `ImplicitlyAnimatedWidget` handles the interpolation for the animation. 
- In between values are usually generated 60 times per second

### Controlling animations:
To control your animations, `ImplicitlyAnimatedWidget` provides you with 3 properties - 
1. `duration` - length of the animation
2. `curve` - rate of change of animation withing the given duration([list of curves](https://api.flutter.dev/flutter/animation/Curves-class.html))
3. `onEnd` - callback function which gets called once the animation completes(can be used to trigger different animation or move to different route once the animation completes)

### Curves:
To provide realistic view to our animations, we can add curve to our implicit animation. For example - if a point moves from one point to another, we can give it a `curve: Curves.bounceOut`. 
- Curves control the rate of change of motion - how fast or slow an animation travels over a given duration.
- Must start at 0.0 and end at 1.0

## Create custom Implicit Animations:
Using `TweenAnimationBuilder` we can create our own custom custom implicit animations. `TweenAnimationBuilder` requires 3 properties - 
1. `duration` - length of animation
2. `builder` - whenever animation value changes, this callback method is invoked and it draws the widgit. So it determines how our animated widgit would look like at a given moment in time for a given value.
3. `tween` - used to generate values in be(tween) a given range. It helps us interpolate between begining and end values.

The `builder` takes 3 parameters - context, value and child. For optimisation purposes, we can pass child widgit to our `builder` so that every time it gets invoked, it does not reconstructs certain widgits which does not depend on the value parameter(in short which are not changing over time).

This way Flutter will know the only widgit that it needs to rebuild from frame to frame. We can also set `static final Tween` wherever the Tween's `begin` and `end` values never changes.

## Examples:
### 1. Social Share Widget

**Read the complete blog tutorial** [here](https://levelup.gitconnected.com/animate-a-social-share-button-using-implicit-animations-in-flutter-9b2b86dd6594)

![1_1IPbJK6vVWkk3aQ-j-X_rg](https://user-images.githubusercontent.com/24974033/131338701-5ef9282d-b4a0-49a2-94b5-520e059acb10.gif)

**Widget diagram:**

![1_Nib3s1s1IikoBLu9FBnglg](https://user-images.githubusercontent.com/24974033/131339499-b9446c7b-f240-4270-83d9-5c90a3835529.png)

**Code:**


```dart
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ShareButton extends StatefulWidget {
  @override
  _ShareButtonState createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  bool isOpen = false;

  _toggleShare() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.fastOutSlowIn,
          width: isOpen ? 240 : 48,
          height: 48,
          decoration: ShapeDecoration(
            color: Colors.grey[400],
            shape: StadiumBorder(),
          ),
        ),
        Container(
          width: 40,
          margin: const EdgeInsets.only(left: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: AnimatedCrossFade(
            duration: const Duration(milliseconds: 450),
            firstChild: IconButton(
              icon: Icon(Icons.share),
              onPressed: () => _toggleShare(),
            ),
            secondChild: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => _toggleShare(),
            ),
            crossFadeState: !isOpen
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 450),
          opacity: isOpen ? 1 : 0,
          child: Container(
            width: 240,
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(AntDesign.twitter),
                  onPressed: () {},
                ),
                IconButton(
                  icon:Icon(AntDesign.facebook_square),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(AntDesign.instagram),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
```
