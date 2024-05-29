//
//  GoogleSignInAuthenticator.swift
//  Swift-Box
//
//  Created by user1 on 17/01/24.
//

import Foundation
import GoogleSignIn

/// An observable class for authenticating via Google.
final class GoogleSignInAuthenticator: ObservableObject {
    private var authViewModel: AuthenticationViewModel
    
    /// Creates an instance of this authenticator.
    /// - parameter authViewModel: The view model this authenticator will set logged in status on.
    init(authViewModel: AuthenticationViewModel) {
        self.authViewModel = authViewModel
    }
    
    /// Signs in the user based upon the selected account.'
    /// - note: Successful calls to this will set the `authViewModel`'s `state` property.
    func signIn() {
#if os(iOS)
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
            print("There is no root view controller!")
            return
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
            guard let signInResult = signInResult else {
                print("Error! \(String(describing: error))")
                return
            }
            
//            let user = signInResult.user
            
//            let emailAddress = user.profile?.email
//            let fullName = user.profile?.name
//            let givenName = user.profile?.givenName
//            let familyName = user.profile?.familyName
//            
//            let profilePicURL = user.profile?.imageURL(withDimension: 320)
//            
//            let idToken = user.idToken
//            
//            print("Email Address: \(String(describing: emailAddress))\nFull Name: \(String(describing: fullName))\nFamily Name: \(String(describing: familyName))\nUser Token: \(String(describing: idToken))")
            
            self.authViewModel.state = .signedIn(signInResult.user)
        }
#endif
    }
    
    /// Signs out the current user.
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        authViewModel.state = .signedOut
    }
    
    /// Disconnects the previously granted scope and signs the user out.
    func disconnect() {
        GIDSignIn.sharedInstance.disconnect { error in
            if let error = error {
                print("Encountered error disconnecting scope: \(error).")
            }
            self.signOut()
        }
    }
    
    func addMailScope(completion: @escaping () -> Void) {
        guard let currentUser = GIDSignIn.sharedInstance.currentUser else {
//            fatalError("No user signed in!")
            return
        }
        
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
            fatalError("No root view controller!")
        }
        
        currentUser.addScopes([MailLoader.mailScope], presenting: rootViewController) { signInResult, error in
            if let error = error {
                print("Found error while adding mail scope: \(error).")
                return
            }
            
            guard let signInResult =  signInResult else { return }
            self.authViewModel.state = .signedIn(signInResult.user)
            completion()
        }
    }
}
