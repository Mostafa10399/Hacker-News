//
//  WebView.swift
//  Hacker News
//
//  Created by Mostafa Mahmoud on 2/3/22.
//
import WebKit
import SwiftUI
import Foundation
struct WebView:UIViewRepresentable
{
    let urlString:String?
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString
        {
            if let url = URL(string: safeString)
            {
                let request = URLRequest(url: url)
                uiView.load(request)
            
            }
        }
        
    }
}
