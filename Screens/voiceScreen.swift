//
//  voiceScreen.swift
//  Swift-Box
//
//  Created by SHIVANSHU DIXIT on 20/02/24.
//

import SwiftUI

struct voiceScreen: View {
    @State var showSplitSheet: Bool = false

    var body: some View {

        
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    //Rectangle 5556
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(#colorLiteral(red: 0.1568627506494522, green: 0.16862745583057404, blue: 0.1921568661928177, alpha: 1)))
                        .frame(height: 200)
                    
                    VStack(alignment: .leading) {
                        
                        
                        
                        //Voice Summary
                        Text("Voice Summary").font(.custom("Arial Bold", size: 33.3)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).padding(.bottom, 40.0).tracking(-0.53).multilineTextAlignment(.center)
                        
                        
                        //Articles about flat Earth theory.
                        Text("Articles about flat Earth \ntheory.").font(.custom("Arial Bold", size: 26.1)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(0.2).lineSpacing(6)
                        
                    }.padding(.leading, -50.0).frame(width: 390, height: 200)
                    
                }
                
                Image("Siri").resizable().padding(.all).frame(width: 220.0, height: 220.0)
                    .offset(y:30)
                
                Spacer()
             
                
                Button(action: {
                    showSplitSheet = true
                }, label: {
                    voiceButtons(option1: "Reply", option2: "Reply All", option3: "Forward")
                })
                    
                   
                
                Spacer()
                
//                voiceMail()
                    .padding(.bottom, 30.0)
                    .padding(.horizontal)
            }
        }
        .sheet(isPresented: $showSplitSheet,
               content: {
          //  composemail()
        })
    }
}

#Preview {
    voiceScreen()
}
