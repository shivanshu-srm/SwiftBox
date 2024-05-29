//
//  MailResponseStructure.swift
//  Swift-Box
//
//  Created by subha on 06/02/24.
//

import Foundation

struct MailResponseStructure: Codable {
    
    let emailAddress: String
    let messagesTotal: Int
    let threadsTotal: Int
    let historyId: String
    
}

struct MessegeListStructure: Codable {
    
    var messages = [messageData]()
    let nextPageToken: String
    let resultSizeEstimate: Int
}

struct messageData: Codable {
    
    let id: String
    let threadId: String
}

//struct MessageStructure: Codable, Identifiable {        For RAW
//
//    let id: String
//    let threadId: String
//    var labelIds = [String]()
//    let snippet: String
//    let sizeEstimate: Int
//    let raw: String
//    let historyId: String
//    let internalDate: String
//}

struct MessageStructure: Codable, Identifiable {
    let id: String
    let threadId: String
    var labelIds = [String]()
    let snippet: String
    let payload: PayLoad
    let sizeEstimate: Int
    let historyId: String
    let internalDate: String
    
}

struct PayLoad: Codable {
    let partId: String
    let mimeType: String
    let filename: String
    var headers = [EachHeader]()
    let body: MessageBody
    let parts: [Part]?
}

struct Part: Codable {
    let partId: String
    let mimeType: String
    let filename: String
    var headers = [EachHeader]()
    let body: MessageBody
    
}

struct MessageBody: Codable {
    let size: Int
    let data: String?
}

struct EachHeader: Codable {
    let name: String
    let value: String
}

struct Body: Codable {
    let size: Int
}

struct Message: Encodable {
    let id = UUID()
    let role: SenderRole
    let content: String
    let createAt: Date
}

struct EmailHTML: Identifiable, Hashable {
    let id: String
    let HTMLbody: String
    let snippet: String
    let subject: String
    let sender: String
}

struct SummaryData: Identifiable, Equatable {
    let id: String
    let HTMLbody: String
    let snippet: String
    let subject: String
    let summary: String
    let sender: String
    
    static func == (lhs: SummaryData, rhs: SummaryData) -> Bool {
        return lhs.id == rhs.id
    }
}

extension MessegeListStructure {
    enum Error: Swift.Error {
        case noMailInResult
    }
}

extension MailResponseStructure {
    enum Error: Swift.Error {
        case noMailInResult
    }
}

extension MessageStructure {
    enum Error: Swift.Error {
        case noMailInResult
    }
}

/*
 profile
 {
 "emailAddress": "mohit2pal@gmail.com",
 "messagesTotal": 4014,
 "threadsTotal": 3643,
 "historyId": "2571810"
 }
 
 messeges.list
 {
   "messages": [
     {
       "id": "18db54deaaf9e4e6",
       "threadId": "18db54deaaf9e4e6"
     },
     {
       "id": "18db512072ae80fb",
       "threadId": "18db512072ae80fb"
     },
   ],
   "nextPageToken": "17823904924268490236",
   "resultSizeEstimate": 201
 }

 */
