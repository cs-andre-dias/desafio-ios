//
//  WebPullViewController.swift
//  desafioIOS
//
//  Created by Andre Dias on 07/11/16.
//  Copyright © 2016 Andre Dias. All rights reserved.
//

import UIKit
import WebKit

class WebPullViewController: UIViewController, WKNavigationDelegate{
    
    var webView: WKWebView!
    var url: NSURL!
    
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.load(URLRequest(url: url! as URL))
        webView.allowsBackForwardNavigationGestures = true
    }
 

}

