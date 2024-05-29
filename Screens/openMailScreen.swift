//
//  openMailScreen.swift
//  Swift-Box
//
//  Created by Sarthak Marwah on 09/01/24.
//

import SwiftUI
import WebKit

struct openMailScreen: View {
    var email: MessageStructure
    var decoder = Decoder()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ScrollView{
                VStack {
                    ZStack {
                        //Rectangle 5556
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(#colorLiteral(red: 0.1568627506494522, green: 0.16862745583057404, blue: 0.1921568661928177, alpha: 1)))
                            .frame(width: 390, height: 140)
                        
                        VStack(alignment: .leading) {
                            senderView(senderName: from, user: to, email: email)
                            
                        }.padding(.leading, -50).frame(width: 390, height: 205)
                    }
                    
                    WebView(htmlString: htmlString)
                        .frame(height: 5000)
                    
                }
            }
        }
    }
    
    
    var from: String {
        for header in email.payload.headers {
            if header.name == "From" {
               let components = header.value.components(separatedBy: "<")
                
                return components[0]
            }
        }
        return "Invalid Sender"
    }
    
    var to: String {
        for header in email.payload.headers {
            if header.name == "To" {
                return header.value
            }
        }
        return "Invalid Reciever"
    }
    
    var htmlString: String {
        
        if let bodyData = email.payload.body.data {
            // If email body is in the main body
            if let decodedString = decoder.decodeBase64String(bodyData) {
                return decodedString
            } else {
                print("Failed to convert email with id: \(email.id)")
            }
        } else if let parts = email.payload.parts {
            // If email body is in different parts
            for part in parts {
                if let partData = part.body.data {
                    if let decodedString = decoder.decodeBase64String(partData) {
                        if part.partId == "1" {
                            return decodedString
                        }
                    } else {
                        print("Failed to convert email part with id: \(part.partId)")
                    }
                }
            }
        } else {
            print("Email contains no Base64 Email Data.")
        }
        
        return "Invalid Conversion"
    }
}

struct WebView: UIViewRepresentable {
    let htmlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let customCSS = """
            <style>
                body {
                    filter: invert(0);
                }
                img, iframe, video {
                    filter: invert(0);
                }
            </style>
        """
        let styledHTMLString = "\(customCSS)\(htmlString)"
        uiView.loadHTMLString(styledHTMLString, baseURL: nil)
    }
}
//
//#Preview {
//    openMailScreen()
//}
