//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Keval Shah on 2/16/16.
//  Copyright © 2016 Keval Shah. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate
{
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "https://www.bignerdranch.com")!
        webView.loadRequest(NSURLRequest(URL: url))
        webView.allowsBackForwardNavigationGestures = true
        print("WebViewController loaded its view")
    }
}