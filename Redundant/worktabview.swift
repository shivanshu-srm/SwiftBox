//
//  worktabview.swift
//  Swift-Box
//
//  Created by user1 on 20/02/24.
//

import SwiftUI

struct worktabview: View {
    var body: some View {
        NavigationStack {
            HStack {
                NavigationLink(destination: personalScreen()) {
              
                        
                        //Personal
                        Text("Personal").font(.custom("Arial Regular", size: 15.7)).foregroundColor(Color(#colorLiteral(red: 0.67, green: 0.67, blue: 0.67, alpha: 1))).multilineTextAlignment(.center).padding(.horizontal, 2.0)
                        
                        
                    Spacer().frame(width: 20)

                
                    Group {
                        //Work
                        
                        VStack {
                            Text("Work").font(.custom("Arial Regular", size: 15.7)).foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.37, blue: 0.92, alpha: 1))).multilineTextAlignment(.center).padding(.horizontal, 2.0)
                                .offset(y:4)
                            
                            Image("bar")
                                .padding(.top, 1.0)
                        }
                    }
                    
                    Spacer().frame(width: 20)

                    NavigationLink(destination: summaryScreen()) {
                        //Summary
                        Text("Summary").font(.custom("Arial Regular", size: 15.7)).foregroundColor(Color(#colorLiteral(red: 0.67, green: 0.67, blue: 0.67, alpha: 1))).multilineTextAlignment(.center).padding(.horizontal, 2.0)
                    }
                    
                    Spacer().frame(width: 20)

                    //Follow up
                    Text("Follow up").font(.custom("Arial Regular", size: 15.7)).foregroundColor(Color(#colorLiteral(red: 0.67, green: 0.67, blue: 0.67, alpha: 1))).multilineTextAlignment(.center)
                        .padding(.horizontal, 2.0)
                    
                }
                .padding(.bottom, 6.0)
                
                
            }
        }
    }
}



#Preview {
    worktabview()
}
