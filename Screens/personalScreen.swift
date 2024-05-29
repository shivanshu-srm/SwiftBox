//
//  personalView.swift
//  Swift-Box
//
//  Created by Subha on 02/01/24.
//

import SwiftUI
import GoogleSignIn

struct personalScreen: View {
    
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @StateObject  var mailDataViewModel = MailDataViewModel(baseUrl: ScopeStore().profile)
    
    
    private var user: GIDGoogleUser? {
        return GIDSignIn.sharedInstance.currentUser
    }
    
    var body: some View {
        VStack {
            //Today MailView
            ZStack {
                
                //Rectangle 2
                RoundedRectangle(cornerRadius: 27)
                    .fill(Color(#colorLiteral(red: 0.1568627506494522, green: 0.16862745583057404, blue: 0.1921568661928177, alpha: 1)))
                    .frame(height: (100 + CGFloat((mailDataViewModel.emails.count*80))))
                    .offset(y:5)
                
                VStack(alignment: .leading) {
                    Text("Today, ").font(.custom("Arial Bold", size: 27.4)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.leading).padding(.leading)
                    
                    Group {
                        ForEach(self.mailDataViewModel.emails) { email in
                            NavigationLink {
                                openMailScreen(email: email)
                            } label: {
                                mailView(email: email)
                            }
                        }
                    }
                    .padding(.top, 5)
                    .padding(.leading)
                    
                }
                .offset(y:5)
            }
            
            //Yesterday MailView
            ZStack{
                
                RoundedRectangle(cornerRadius: 27)
                    .fill(Color(#colorLiteral(red: 0.1568627506494522, green: 0.16862745583057404, blue: 0.1921568661928177, alpha: 1)))
                    .frame( height: 325)
                
                VStack(alignment: .leading) {
                    Text("Yesterday").font(.custom("Arial Bold", size: 27.4)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.leading).padding(.leading)
                    
                }
            }
            
        }
        .onAppear {
            guard self.mailDataViewModel.data != nil else {
                if !self.authViewModel.hasMailScope {
                    self.authViewModel.addMailScope {
                        mailDataViewModel.fetchMail()
                    }
                } else {
                    self.mailDataViewModel.fetchMail()
                }
                return
            }
        }
        
        //        if let _ = self.mailDataViewModel.data {
        //            Text(mailDataViewModel.data?.emailAddress ?? "No Email")
        //        } else { Text("No User Signed In") }
        
    }
}
                    

#Preview {
    personalScreen()
        .environmentObject(AuthenticationViewModel())
}
