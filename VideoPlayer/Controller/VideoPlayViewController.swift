//
//  VideoPlayViewController.swift
//  VideoPlayer
//
//  Created by vijay on 05/12/19.
//  Copyright © 2019 vijay. All rights reserved.
//

import UIKit
import WebKit

class VideoPlayViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var videoPlayWebView: WKWebView!
    @IBOutlet weak var videoActivityViewer: UIActivityIndicatorView!
    var videoUrl = String()
    let segueIdentifier = "WKWebView"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.videoPlayWebView.navigationDelegate = self
        playVideo()
        stopActivityViewer()
        
    }
    
    func playVideo(){
       // let urlString = "https://www.finnovationz.com/dummy/Lost-in-Space.mp4"
        let videoURL = URL(string: videoUrl)
        let requestObj = URLRequest(url: videoURL!)
        self.videoPlayWebView.load(requestObj)
        
        videoActivityViewer.startAnimating()
        self.videoActivityViewer.isHidden = false
        }
    func stopActivityViewer(){
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            self.videoActivityViewer.stopAnimating()
            self.videoActivityViewer.isHidden = true
        }
    }
}
