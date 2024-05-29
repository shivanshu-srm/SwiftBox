//
//  summaryScreen.swift
//  Swift-Box
//
//  Created by Subha on 02/01/24.
//

import SwiftUI
import GoogleSignIn

struct summaryScreen: View {
    
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @StateObject  var mailDataViewModel = MailDataViewModel(baseUrl: ScopeStore().profile)
    
    private var user: GIDGoogleUser? {
        return GIDSignIn.sharedInstance.currentUser
    }
    
    var body: some View {
        VStack {
            
            ZStack {
                
                //Rectangle 2
                RoundedRectangle(cornerRadius: 27)
                    .fill(Color(#colorLiteral(red: 0.1568627506494522, green: 0.16862745583057404, blue: 0.1921568661928177, alpha: 1)))
                    .frame(height: (100 + CGFloat((mailDataViewModel.summaryEmail.count*110))))
                    .offset(y:-5)
                
                VStack(alignment: .leading) {
                    //Today
                    Text("Today,").font(.custom("Arial Bold", size: 27.4)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.center).padding(.leading, 6.0)
                        .offset(x: 2,y:1)
                    
                    ForEach(Array(self.mailDataViewModel.summaryEmail)) { email in
                        NavigationLink {
                            if let theMessageStructure = findMessageStructure(for: email){
                                RelatedMailScreen(email: theMessageStructure, summaryData: email)
                            }
                        } label: {
                            summaryView(email: email)
                        }
                    }
                }
                .padding(.horizontal, 10)
                
            }
            .offset(y:11)
            
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
        .padding(.bottom)
        
        
    }
    
    func findMessageStructure(for summaryData: SummaryData) -> MessageStructure? {
        return mailDataViewModel.emails.first { $0.id == summaryData.id }
    }
}

#Preview {
    summaryScreen()
        .environmentObject(AuthenticationViewModel())
}
