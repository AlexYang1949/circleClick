//
//  drawView.m
//  demo
//
//  Created by haoqidai on 15/7/31.
//  Copyright (c) 2015年 devYang. All rights reserved.
//

#import "drawView.h"

@implementation drawView

- (instancetype)init{
    if (self=[super init]) {
        // 创建12个按钮添加到中间的轮盘上

    }
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        for (int index = 0; index<5; index++) {
           
            self.backgroundColor=[UIColor redColor];
            UITapGestureRecognizer *gesture=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            [self addGestureRecognizer:gesture];
        }

    }
    return self;
}


-(void)tap:(UITapGestureRecognizer *)gesture{
    CGPoint point=[gesture locationInView:self];
    CGFloat x=point.x;
    CGFloat y=point.y;
//    CGPoint center=self.bounds.size.width/2;
    double r=self.bounds.size.width/2;
//    NSLog(@"x=%f,y=%f,r=%f",x,y,r);
//
    int dx=x-r;
    int dy=y-r;
//    NSLog(@"%f",sqrt(abs(dx)*abs(dx)+abs(dy)*abs(dy)));
    if (sqrt(abs(dx)*abs(dx)+abs(dy)*abs(dy))<r) {
        NSLog(@"点中了圆");
        NSLog(@"dx =%d dy= %d %f",dx,dy,(float)dx/dy);
        float div=(float)dx/dy;
        if (dx>0&&dy<0&&div<0&&div>-3.15) {
            NSLog(@"1");
        }else if(dx>0&&(div>0.7||div<-3.15)){
            NSLog(@"2");
        }else if (dy>0&&(div<0.7&&div>-0.7)){
            NSLog(@"3");
        }else if(dx<0&&(div<-0.7||div>3.15)){
            NSLog(@"4");
        }else{
            NSLog(@"5");
        }
       
    }
}

-(void)drawRect:(CGRect)rect{
    CGRect frame = self.bounds;
   
    /*画填充圆
     */
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(context, rect);
    
    CGContextAddEllipseInRect(context, frame);
    CGContextSetFillColorWithColor(context, [UIColor orangeColor].CGColor);//填充颜色
    CGContextFillPath(context);
    // 360 36

    for (int i=0; i<5; i++) {
        CGFloat red = (CGFloat)random()/(CGFloat)RAND_MAX;
        CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
        CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
//        NSLog(@"%d red%f %f %f",i,red,green,blue);
        UIColor * aColor = [UIColor colorWithRed:red green:green blue:blue alpha:0.5];
        NSLog(@"%@",aColor);

        CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
        //以10为半径围绕圆心画指定角度扇形
        CGContextMoveToPoint(context, rect.size.width/2, rect.size.height/2);
        CGContextAddArc(context, 150, 150, 150,  (i*0.2-0.25) * M_PI*2, (i*0.2-0.25) * M_PI*2 , 0);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathStroke); //绘制路径
        CGContextSaveGState(context);
//        CGContextFillPath(context);
//        CGContextFillPath(context);
    }
//    CGContextFillPath(context);

    
}

@end
