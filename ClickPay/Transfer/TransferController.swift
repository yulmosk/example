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

class TransferController: UIViewController, URLSessionDelegate,URLSessionDataDelegate {
   
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
        webView.backgroundColor = .white
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
        activityIndicator.backgroundColor = .white
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
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        doRequest()
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
    
    func doRequest(){
        showActivityIndicator(true)
        
        //Это верменный запрос
        let name = "P2P_RequestMob"
        print("Это имя операции: \(name)")
        let document = AEXMLDocument()
        
        let attributes = [
            "xmlns:soapenv": "http://schemas.xmlsoap.org/soap/envelope/",
            "xmlns:tem": "http://tempuri.org/"
        ]
        let envelopeElement = document.addChild(
            name: "soapenv:Envelope", attributes: attributes
        )
        envelopeElement.addChild(name: "soapenv:Header")
        let bodyElement = envelopeElement.addChild(name: "soapenv:Body")
        let actionElement = bodyElement.addChild(name: "tem:\(name)")
        actionElement.addChild(
            name: "tem:ClientId",
            value: "0"
        )
        actionElement.addChild(
            name: "tem:PaymentDestination",
            value: Constants.forms[formIndex]
        )
        actionElement.addChild(
            name: "tem:Lang",
            value: Constants.getLang()
        )
        actionElement.addChild(
            name: "tem:Ip",
            value: getWiFiAddress() ?? "unavailable"
        )
        
        
        
        let envelope = document.xmlCompact
        print(envelope)

        
        
        let urlString = "https://46.55.111.156/ClickPayService/Service.svc?wsdl"

        let url = URL(string: urlString)
        var theRequest = URLRequest(url: url!)
        let msgLength = envelope.count
        
        theRequest.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        theRequest.addValue("\(msgLength)", forHTTPHeaderField: "Content-Length")
        theRequest.addValue("http://tempuri.org/IClickPayService/P2P_RequestMob", forHTTPHeaderField: "SOAPAction")
        
        
        theRequest.httpMethod = "POST"
        theRequest.httpBody = envelope.data(using: .utf8)
        print("Проверяем: ")
       
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration:config, delegate: self, delegateQueue: OperationQueue.main)
       
        let task = session.dataTask(with: theRequest, completionHandler:{ (data, response, error) -> Void in
            if let err = error {
                print("error \(err)")
                //complete(nil, err)
                return
            }
            
            do {
                let (code, message) = try xmlParse(from: data!)
                self.webView.loadHTMLString(message!, baseURL: nil)
                //self.formView.loadHTMLString(message!, baseURL: nil)
                //complete(response, nil)
            } catch {
                print("error on parse \(error)")
                //complete(nil, error)
            }
        })
        task.resume()
    }
    
    
    func goBack(){
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
}
