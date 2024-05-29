//
//  loginScreen.swift
//  Swift-Box
//
//  Created by Subha on 08/01/24.
//

import SwiftUI

struct loginScreen: View {
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    
                    //Welcome back, Varun!
                    Text("Welcome back, Varun!").font(.custom(" Arial Bold", size: 45))
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).padding(.horizontal, 11.0).tracking(-0.36)
                        .frame(width: 320 ,alignment: .leading)
                        .padding(.bottom, 20.0)
                        .padding(.top, 100.0)
                    
                    Spacer()
                                    
                                        Image("LOGO")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                        Spacer()
                    

                    
                    
                    Text("Sign in to SwiftBox").font(.custom("Arial Bold", size: 25)).fontWeight(.heavy).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).padding(.vertical, 4.0)
                                        
                                        Spacer().frame(height: 50)
                    

                        loginButttons()
                        
                    Spacer()
                    
                    //Don’t have an account yet?
                    Text("Don’t have an account yet?").font(.custom("Poppins Regular", size: 12)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.36)
                    
                    //Sign Up
                    Text("Sign Up").font(.custom("Poppins Bold", size: 12)).underline().foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.36)
                }
            }
        }
    }
}

#Preview {
    loginScreen()
        .environmentObject(AuthenticationViewModel())
}

