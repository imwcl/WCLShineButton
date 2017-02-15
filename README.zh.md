# WCLShineButton
类似太阳动画的button

![](DemoGif.gif)

#### ![cn](https://raw.githubusercontent.com/gosquared/flags/master/flags/flags/shiny/24/China.png) **Chinese (Simplified)**: 
####[英文说明](README.md)
######[博客介绍](http://www.jianshu.com)

## 使用

```swift
var param1 = WCLShineParams()
param1.bigShineColor = UIColor(rgb: (153,152,38))
param1.smallShineColor = UIColor(rgb: (102,102,102))
let bt1 = WCLShineButton(frame: .init(x: 100, y: 100, width: 60, height: 60), params: param1)
bt1.fillColor = UIColor(rgb: (153,152,38))
bt1.color = UIColor(rgb: (170,170,170))
bt1.addTarget(self, action: #selector(action), for: .touchUpInside)
view.addSubview(bt1)
```

## **详细使用**

| **属性**                | **描述**         |
| --------------------- | -------------- |
| color                 | button的默认颜色    |
| fillColor             | button的填充颜色    |
| allowRandomColor      | 允许shine的颜色随机   |
| animDuration          | 动画的时间         |
| bigShineColor         | 大太阳的颜色         |
| enableFlashing        | 是否需要flash的效果   |
| shineCount            | 太阳的个数          |
| shineTurnAngle        | 太阳的旋转角度        |
| shineDistanceMultiple | 太阳的扩散范围        |
| smallShineOffsetAngle | 小太阳和大太阳之前的偏移角度 |
| smallShineColor       | 小太阳的颜色         |
| shineSize             | 大太阳的半径         |
| colorRandom           | 太阳的颜色的数组       |
| image                 | button的image   |

## **联系我**

**[blog]( http:blog.imwcl.com)**

**[CSDN](http://blog.csdn.net/wang631106979)**

## 代码参考

[ShineButton](https://github.com/ChadCSong/ShineButton)

## **许可**

WCLShineButton is released under the [MIT license](https://github.com/631106979/WCLShineButton/blob/master/LICENSE). See LICENSE for details.
