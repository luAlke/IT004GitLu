//
//  ViewController.m
//  PostRequest
//
//  Created by Mac on 16/1/27.
//  Copyright © 2016年 鲁振. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate> {
    NSMutableData  *_data;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSString *urlStr=@"http://172.16.11.133:8080/hs/st";
    
    
    
        //这个方法是设置请求数据 setHTTPBody
    NSString *str=@"http://172.16.11.133:8080/hs/st?name=wxg&psw=123456";
    
    //这个类不但可以发送get请求还可以发送post请求, NSURLRequest是发送get请求的
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:str]];
    
    //设置请求类型
    //    [request setHTTPMethod:@"POST"];
    [request setHTTPMethod:@"GET"];
    //这个方法是字符串转化成data类型
//    [request setHTTPBody:[str dataUsingEncoding:NSUTF8StringEncoding]];
    
    [NSURLConnection connectionWithRequest:request delegate:self];
//    [NSURLConnection connectionWithRequest:request delegate:self];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    _data=[[NSMutableData alloc]init];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_data appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
 
    NSString *str=[[NSString alloc]initWithData:_data encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",str);
    [str release];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
