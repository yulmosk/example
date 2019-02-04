//
//  TransferController.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 29/12/2018.
//  Copyright © 2018 Yulia Moskaleva. All rights reserved.
//

import UIKit
import AEXML
import WebKit
import SafariServices

class TransferController: BaseController, URLSessionDelegate,URLSessionDataDelegate {
   
    var presenter: TransferPresenter?
    var formIndex = 0
    
    private lazy var webView: WKWebView = {
        let config = WKWebViewConfiguration()
        
        config.allowsAirPlayForMediaPlayback = false
        config.allowsInlineMediaPlayback = false
        config.allowsPictureInPictureMediaPlayback = false
        config.ignoresViewportScaleLimits = false
        let source: String = Constants.scriptjs
        let scriptjs: WKUserScript = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        userContentController.addUserScript(scriptjs)
        config.userContentController = userContentController
        
        let bounds = UIScreen.main.bounds
        
        let webView = WKWebView(frame: bounds, configuration: config)
        webView.backgroundColor = .clear
        webView.navigationDelegate = self
        webView.scrollView.delegate = self
        webView.allowsLinkPreview = false
        webView.allowsBackForwardNavigationGestures = false
        webView.contentMode = .scaleAspectFill
        
        view.insertSubview(webView, belowSubview: activityIndicator)
       
        return webView
    }()

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.backgroundColor = .clear
        activityIndicator.color = .primary()

        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }()
    
    lazy var userContentController: WKUserContentController = {
        return WKUserContentController()
    }()

    let controllerNibName = "TransferController"
    init() {
        super.init(nibName: controllerNibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.primary()
        presenter?.loadForm(formIndex: formIndex)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        activityIndicator.frame = view.bounds
        webView.frame = view.bounds
    }
    
    func showActivityIndicator(_ show: Bool) {
        if show {
            view.bringSubviewToFront(activityIndicator)
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
            view.sendSubviewToBack(activityIndicator)
        }
        makeForm(!show)
    }
    
    func makeForm(_ visible: Bool) {
        let alpha: CGFloat = visible ? 1 : 0
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: .beginFromCurrentState,
            animations: { [weak self] in
                guard let vc = self else { return }
                vc.webView.alpha = alpha
            }
        )
    }
    
    func openPDF(request: URLRequest) {
        guard let url = request.url else { return }
       
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredBarTintColor = .white
        safariVC.preferredControlTintColor = .primary()
        
        present(safariVC, animated: true, completion: nil)
        
    }
        
    func goBack(){
        navigationController?.popViewController(animated: true)
    }
    
    func showErrorInfo(message: String){
        showActivityIndicator(false)
        addImage()
        let action = PopupAction(title: "Popup.Action.Ok".localized) { [weak self]  in
            self?.webView.load(URLRequest(url: URL(string: "about:blank")!))
            self?.goBack()
        }
        PopupController.showPopup(message: message, actions: [action], on: self)
    }
    
    func loadForm(htmlString: String){
        if(htmlString.contains(Constants.doNotGetForm)){
            showActivityIndicator(false)
            addImage()
            let action = PopupAction(title: "Popup.Action.Ok".localized) { [weak self]  in
               self?.goBack()
            }
             PopupController.showPopup(message: "P2P.Form.Failed".localized, actions: [action], on: self)
        } else {
            self.webView.loadHTMLString(htmlString, baseURL: nil)
        }
    }
    
    func addImage(){
        let image = UIImage(named: "StartBg")
        let imageView = UIImageView(image: image!)
        imageView.frame = view.bounds
        view.addSubview(imageView)
    }
    
}
