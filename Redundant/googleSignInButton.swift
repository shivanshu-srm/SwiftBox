//
//  googleSignInButton.swift
//  Swift-Box
//
//  Created by user1 on 17/01/24.
//

import SwiftUI
import GoogleSignInSwift

struct googleSignInButton: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    var body: some View {
        GoogleSignInButton(action: authViewModel.signIn)
    }
}

#Preview {
    googleSignInButton()
        .environmentObject(AuthenticationViewModel())
}
