//
//  WorkScreen.swift
//  Swift-Box
//
//  Created by SHIVANSHU DIXIT on 20/02/24.
//

import SwiftUI

struct WorkScreen: View {
    var body: some View {
        VStack {
            
            //Today MailView
            ZStack {
                
                //Rectangle 2
                RoundedRectangle(cornerRadius: 27)
                    .fill(Color(#colorLiteral(red: 0.1568627506494522, green: 0.16862745583057404, blue: 0.1921568661928177, alpha: 1)))
                    .frame(height: 325)
                
                
                VStack(alignment: .leading) {
                    Text("Today, ").font(.custom("Arial Bold", size: 27.4)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.leading).padding(.leading)
                    
                    //                                Group {
                    //                                    NavigationLink(destination: openMailScreen(email: <#T##MessageStructure#>)) {
                    //                                        workmailview()
                    //
                    //                                    }
                    workmailview()
                    workmailview()
                    workmailview()
                }
                .padding(.top, 5)
                .padding(.leading)
                
            }
            
            
            //Yesterday MailView
            ZStack{
                
                RoundedRectangle(cornerRadius: 27)
                    .fill(Color(#colorLiteral(red: 0.1568627506494522, green: 0.16862745583057404, blue: 0.1921568661928177, alpha: 1)))
                    .frame( height: 325)
                
                VStack(alignment: .leading) {
                    Text("Yesterday").font(.custom("Arial Bold", size: 27.4)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.leading).padding(.leading)
                    
                    Group {
                        workmailview()
                        workmailview()
                        workmailview()
                    }
                    .padding(.top, 5)
                    .padding(.leading)
                    
                }
            }
            
        }
        .offset(y:6)
    }
}




#Preview {
    WorkScreen()
}
