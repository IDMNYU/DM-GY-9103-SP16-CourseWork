//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Yuchi on 22/2/16.
//  Copyright © 2016 Yuchi. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var webView: WKWebView!
    
    let url = "http://apple.com"
    
    override func loadView() {
        //create a web view
        webView = WKWebView()
        
        //set view
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        print("WebViewController loaded its view")
        
    }
    
}
