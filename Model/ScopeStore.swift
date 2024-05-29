//
//  ScopeStore.swift
//  Swift-Box
//
//  Created by subha on 17/02/24.
//

import Foundation

struct ScopeStore: Identifiable {
    var id = UUID()
    var profile = "https://gmail.googleapis.com/gmail/v1/users/me/profile"
    var messegesList = "https://gmail.googleapis.com/gmail/v1/users/me/messages?maxResults=5"
    var messegesGet = "https://gmail.googleapis.com/gmail/v1/users/me/messages/"
}
