//
//  VideoCell.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 11/02/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//

import UIKit
import WebKit

class VideoCell: UITableViewCell {

    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func fill(index:Int){
        let video = addVideoFrame(videoView: videoView)
       
        let url = URL(string: Constants.youTubeEndPoint + "Video.Code.\(index)".localized)
        video.load(URLRequest(url: url!))
        
        titleLabel.text = "Video.Title.\(index)".localized.uppercased()
        
    }
    
    func addVideoFrame(videoView:UIView) -> WKWebView {
        let config = WKWebViewConfiguration()
        
        config.allowsAirPlayForMediaPlayback = false
        config.allowsInlineMediaPlayback = false
        config.allowsPictureInPictureMediaPlayback = false
        config.ignoresViewportScaleLimits = false
        
        let bounds = videoView.bounds
        
        let webView = WKWebView(frame: bounds, configuration: config)
        webView.backgroundColor = .clear
    
        webView.allowsLinkPreview = false
        webView.allowsBackForwardNavigationGestures = false
        webView.contentMode = .scaleAspectFill
        let path = UIBezierPath(roundedRect: videoView.bounds, byRoundingCorners: [.topLeft,.topRight, .bottomLeft,.bottomRight], cornerRadii: CGSize(width: 7, height: 7))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        webView.layer.mask = mask
        
        videoView.addSubview(webView)
        
        return webView
    }
}
