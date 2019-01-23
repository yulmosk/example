//
//  FormView.swift
//  ClickPay
//
//  Created by Yulia Moskaleva on 04/01/2019.
//  Copyright © 2019 Yulia Moskaleva. All rights reserved.
//
import WebKit
import UIKit

extension TransferController {
    
    private func handleRequest(request: URLRequest) -> WKNavigationActionPolicy {
        guard let url = request.url else { return .cancel }
        let target = url.absoluteString.lowercased()
        
        switch target {
        
        case let response where response.contains("rc="):
            var message = "P2P.Transaction.Failed".localized
            if  response.contains("rc=00") {
                message = "P2P.Transaction.Success".localized
            }
            if response.contains("rc=09"){
                message = "P2P.Transaction.Success".localized
            }
            
            showInfo(message: message, bottomTitle: "OK"){ [weak self] in
                self?.goBack()
            }
            
            return .cancel
            
        case let answer where answer.contains(".pdf"):
             print("Это случай инструкции")
             openPDF(request: request)
            
        case let timeout where timeout.contains("timeout.php"):
            print("Это случай timeout")
            let message = "P2P.Error.SessionExpired".localized
            let leftTitle = "Popup.Action.Cancel".localized
            let rightTitle = "Popup.Action.Refresh".localized
            
            showConfirm(message: message, leftTitle: leftTitle, rightTitle: rightTitle){ [weak self] str in
                switch str {
                    case "left":
                         self?.goBack()
                    case "right":
                        self?.presenter?.loadForm(formIndex: self?.formIndex ?? 0)
                    default:
                        self?.goBack()
                }
            }
            return .cancel
            
        case let x where x == "https://www.secure11gw.ro/portal/cgi-bin/":
            print("Это случай загрузки формы")
            return .allow
            
        case let answer where answer.contains("clickpay.md"):
            print("Это переход на сайт")
            userContentController.removeAllUserScripts()
            goBack()
            
            return .cancel
            
        case let answer where answer.contains("fincom/response_new.php"):
            print("Это нажали на отмену")
            userContentController.removeAllUserScripts()
            goBack()
            
            return .cancel
            
        default:
            return .allow
        }
        
        return .cancel
    }
}

extension TransferController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation) {
        showActivityIndicator(false)
    }
    
    
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void)
    {
        let decision = handleRequest(request: navigationAction.request)
        if decision == .allow {
            showActivityIndicator(true)
        }
        
        decisionHandler(decision)
    }
    
    func webView(
        _ webView: WKWebView,
        didFail navigation: WKNavigation!,
        withError error: Error)
    {
       showActivityIndicator(false)
    }
}

extension TransferController: UIScrollViewDelegate {
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollView.pinchGestureRecognizer?.isEnabled = false
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }
}



