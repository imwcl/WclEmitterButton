**CAEmitterLayer**是ios5中苹果引入了一个新的CALayer子类。CAEmitterLayer是一个高性能的粒子引擎，可以用来做一些绚丽的粒子系统，比如爆炸，雪花火焰等等。

- [我的CDSN](http://blog.csdn.net/wang631106979/article/details/51258020)
- [我的个人博客](http://imwcl.com/2016/04/27/CALayer学习之CAEmitterLayer，粒子发射系统)

![效果图][1]

## CAEmitterCell ##
**CAEmitterCell**: CAEmitterCell是粒子发射系统里的粒子，用CAEmitterCell来定义你所需要的粒子的样式，图片，颜色，方向，运动，缩放比例和生命周期等等。

- 属性列表

| 属性名 | 作用 |
| ------ | ---- |
| alphaRange |  一个粒子的颜色alpha能改变的范围 |
| alphaSpeed | 粒子透明度在生命周期内的改变速度 |
| birthrate | 每秒发射的粒子数量 |
| blueRange | 一个粒子的颜色blue 能改变的范围 |
| blueSpeed | 粒子blue在生命周期内的改变速度 |
| color | 粒子的颜色 |
| contents | 是个CGImageRef的对象,既粒子要展现的图片 |
| contentsRect | 应该画在contents里的子rectangle |
| emissionLatitude | 发射的z轴方向的角度 |
| emissionLongitude | x-y平面的发射方向 |
| emissionRange | 周围发射角度 |
| emitterCells | 粒子发射的粒子的数组 |
| enabled | 粒子是否被渲染 |
| greenrange | 一个粒子的颜色green 能改变的范围 |
| greenSpeed | 粒子green在生命周期内的改变速度 |
|lifetime | 生命周期 |
| lifetimeRange | 生命周期范围 lifetime= lifetime(+/-) lifetimeRange
| magnificationFilter | 增加自己的大小 |
| minificatonFilter | 减小自己的大小 |
| minificationFilterBias | 减小大小的因子 |
|name | 粒子的名字 |
| redRange | 一个粒子的颜色red 能改变的范围 |
| redSpeed |  粒子red在生命周期内的改变速度 |
| scale | 缩放比例 |
| scaleRange | 缩放比例范围 |
|scaleSpeed | 缩放比例速度 |
|spin | 子旋转角度 | 
|spinrange | 子旋转角度范围 |
|velocity | 速度 |
|velocityRange | 速度范围 |
|xAcceleration | 粒子x方向的加速度分量 |
|yAcceleration | 粒子y方向的加速度分量 |
|zAcceleration | 粒子z方向的加速度分量 |

- 代码示例

```swift
let explosionCell           = CAEmitterCell()
explosionCell.name          = "explosion"
explosionCell.alphaRange    = 0.10
explosionCell.alphaSpeed    = -1.0
explosionCell.lifetime      = 0.7
explosionCell.lifetimeRange = 0.3
explosionCell.birthRate     = 0
explosionCell.velocity      = 40.00
explosionCell.velocityRange = 10.00
explosionCell.scale         = 0.03
explosionCell.scaleRange    = 0.02
explosionCell.contents      = UIImage(named: "Sparkle")?.CGImage
```
----------

## CAEmitterLayer ##
**CAEmitterLayer** ：CAEmitterLayer类提供了一个粒子发射器系统为核心的动画。这些粒子是由CAEmitterCell组成的实例，它相当于一个管理者，来管理 CAEmitterCell的发射的一些细节，比如发射的位置，发射形状等等。

- 属性列表

| 属性名 | 做用 |
| -----  | ---- |
| emitterPosition | 发射位置 |
| emitterSize | 发射源的大小 |
| emitterMode | 发射模式  |
| emitterShape | 发射源的形状 |
| renderMode | 渲染模式 |
| birthRate | 粒子产生系数，默认1.0 |
| emitterCells | 装着CAEmitterCell对象的数组，被用于把粒子投放到layer上 |
| emitterDepth | 决定粒子形状的深度联系 |
| emitterZposition | 发射源的z坐标位置 |
| lifetime |粒子生命周期 |
| scale | 粒子的缩放比例 |
| seed | 用于初始化随机数产生的种子 |
| spin | 自旋转速度 |
|velocity | 粒子速度 |


- 代码示例

```
explosionLayer = CAEmitterLayer()
explosionLayer.name          = "emitterLayer"
explosionLayer.emitterShape  = kCAEmitterLayerCircle;
explosionLayer.emitterMode   = kCAEmitterLayerOutline;
explosionLayer.emitterSize   = CGSizeMake(10, 0);
explosionLayer.emitterCells  = [explosionCell]
explosionLayer.renderMode    = kCAEmitterLayerOldestFirst;
explosionLayer.masksToBounds = false
explosionLayer.position      = CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0);
explosionLayer.zPosition     = -1;
layer.addSublayer(explosionLayer)
```

[1]: http://img.blog.csdn.net/20160426232735405
