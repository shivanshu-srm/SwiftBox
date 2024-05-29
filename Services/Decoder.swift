//
//  Base64Decoder.swift
//  Swift-Box
//
//  Created by subha on 03/03/24.
//

import Foundation
import SwiftSoup

final class Decoder: ObservableObject {
    
    @Published var messages: [Message] = [Message(role: .system, content: "Whatever content is given to you, you have to generate two seperate polar replies to it, like if it is a mail about a proposal, create a proposal acceptance draft and a Proposal restructuring draft, and generate two seperate messages for each response", createAt: Date())]
    
    private let openAIService = OpenAIServices()
    
    @Published var generatedResponse: String = ""
    
    func decodeBase64String(_ base64String: String) -> String? {
        // Step 1: Pad the base64 string if needed
        var paddedBase64 = base64String
        while paddedBase64.count % 4 != 0 {
            paddedBase64.append("=")
        }
        
        // Step 2: Replace characters for HTTP transfers
        let replacedBase64 = paddedBase64
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        
        // Step 3: Convert the prepared base64 string into Data
        if let decodedData = Data(base64Encoded: replacedBase64, options: .ignoreUnknownCharacters) {
            // Convert Data to String
            if let decodedString = String(data: decodedData, encoding: .utf8) {
                return decodedString
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    func removeHTMLTags(from htmlString: String) -> String {
        
        do {
                let document = try SwiftSoup.parse(htmlString)
                
                // Remove all script and style elements
                try document.select("script, style").remove()
                
                // Get the text content of the document
                let cleanText = try document.text()
                
                return cleanText
            } catch {
                print("Error while removing HTML and CSS: \(error.localizedDescription)")
                return htmlString
            }
    }
    
    func fetchResponse(for HTML: String, responseType: ResponseType){
        let newMessage = Message( role: .user, content: removeHTMLTags(from: HTML), createAt: Date())
        messages.append(newMessage)
        
        Task {
            let response = await openAIService.sendMessage(messages: messages)
            guard let receivedOpenAIMessage = response?.choices.first?.message else{
                print("Had no received message.")
                return
            }
            _ = Message( role: receivedOpenAIMessage.role, content: receivedOpenAIMessage.content, createAt: Date())
            await MainActor.run{
                let parts = receivedOpenAIMessage.content.components(separatedBy: "---")
                
                switch responseType {
                case .acceptance:
                    generatedResponse = parts[0].trimmingCharacters(in: .whitespacesAndNewlines)
                case.restructuring:
                    generatedResponse = parts[1].trimmingCharacters(in: .whitespacesAndNewlines)
                }
                }
            }
        }
    
    enum ResponseType {
        case acceptance
        case restructuring
    }

}
