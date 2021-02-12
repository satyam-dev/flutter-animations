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
