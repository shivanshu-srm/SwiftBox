//
//  DefaultScreen.swift
//  Swift-Box
//
//  Created by subha on 05/03/24.
//

import SwiftUI

struct DefaultScreen: View {
    @State var tabChoice: String = "personal"
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @StateObject  var mailDataViewModel = MailDataViewModel(baseUrl: ScopeStore().profile)
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        
                        profile_pic()
                            .padding(.top)
                            .padding(.leading, 25.0)
                      //      .onTapGesture(perform: authViewModel.signOut)
                        
                        NavigationLink(destination: SettingsView()) {
                            setting_back()
                                .padding([.top, .leading, .trailing])
                        }
                    }
                    
                    
                    //All Inboxes
                    Text("All Inboxes").font(.custom("Arial Bold", size: 33.3)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).padding([.top, .leading]).tracking(-0.53).multilineTextAlignment(.center)
                    
                    
                    searchbar()
                        .padding(.horizontal)
                    accountsTab()
                    
                    HStack {
                        
                        Button {
                            tabChoice = "personal"
                        } label: {
                            VStack {
                                if tabChoice == "personal" {
                                    Text("Personal")
                                        .font(.custom("Arial Regular", size: 16))
                                        .multilineTextAlignment(.center).padding(.horizontal, 2.0)
                                    Image("bar")
                                        .padding(.vertical, -4)
                                } else {
                                    Text("Personal")
                                        .font(.custom("Arial Regular", size: 16))
                                        .foregroundColor(Color(#colorLiteral(red: 0.67, green: 0.67, blue: 0.67, alpha: 1)))
                                        .multilineTextAlignment(.center).padding(.horizontal, 2.0)
                                    Image("bar")
                                        .padding(.vertical, -4)
                                        .colorMultiply(.black)
                                }
                            }
                        }
                        
                        Spacer().frame(width: 20)
                        
                        Button {
                            tabChoice = "work"
                        } label: {
                            VStack {
                                if tabChoice == "work" {
                                    Text("Work")
                                        .font(.custom("Arial Regular", size: 15.7))
                                        .multilineTextAlignment(.center).padding(.horizontal, 2.0)
                                    Image("bar")
                                        .padding(.vertical, -4)
                                } else {
                                    Text("Work")
                                        .font(.custom("Arial Regular", size: 15.7))
                                        .foregroundColor(Color(#colorLiteral(red: 0.67, green: 0.67, blue: 0.67, alpha: 1)))
                                        .multilineTextAlignment(.center).padding(.horizontal, 2.0)
                                    Image("bar")
                                        .padding(.vertical, -4)
                                        .colorMultiply(.black)
                                }
                            }
                        }
                        
                        Spacer().frame(width: 20)
                        
                        Button {
                            tabChoice = "summary"
                        } label: {
                            VStack {
                                if tabChoice == "summary" {
                                    Text("Summary")
                                        .font(.custom("Arial Regular", size: 15.7))
                                        .multilineTextAlignment(.center).padding(.horizontal, 2.0)
                                    Image("bar")
                                        .padding(.vertical, -4)
                                } else {
                                    Text("Summary")
                                        .font(.custom("Arial Regular", size: 15.7))
                                        .foregroundColor(Color(#colorLiteral(red: 0.67, green: 0.67, blue: 0.67, alpha: 1)))
                                        .multilineTextAlignment(.center).padding(.horizontal, 2.0)
                                    Image("bar")
                                        .padding(.vertical, -4)
                                        .colorMultiply(.black)
                                }
                            }
                        }
                        
                        Spacer().frame(width: 20)
                        
                        Button{
                            
                        } label: {
                            VStack {
                                Text("Follow up").font(.custom("Arial Regular", size: 15.7)).foregroundColor(Color(#colorLiteral(red: 0.67, green: 0.67, blue: 0.67, alpha: 1))).multilineTextAlignment(.center)
                                    .padding(.horizontal, 2.0)
                                if tabChoice == "" {
                                    Image("bar")
                                        .padding(.vertical, -4)
                                } else {
                                    Image("bar")
                                        .padding(.vertical, -4)
                                        .colorMultiply(.black)
                                }
                            }
                        }
                    }
                    .padding(.bottom, -4.0)
                    .padding(.horizontal)
                    

                    switch tabChoice {
                    case "personal":
                        personalScreen()
                    case "work":
                        WorkScreen()
                    case "summary":
                        summaryScreen()
                    default:
                        personalScreen()
                    }
                }
            }
        }
    }
}

#Preview {
    DefaultScreen()
        .environmentObject(AuthenticationViewModel())
}
