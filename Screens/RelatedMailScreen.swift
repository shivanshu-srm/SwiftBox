//
//  RelatedMailScreen.swift
//  Swift-Box
//
//  Created by Sarthak Marwah on 11/01/24.
//

import SwiftUI

struct RelatedMailScreen: View {
    @State var showSplitSheet: Bool = false
    var email: MessageStructure
    var summaryData: SummaryData
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.black
                    .ignoresSafeArea()
                ScrollView {
                    VStack{
                        ZStack{
                            Color.black
                                .ignoresSafeArea()
                            //Rectangle 5556
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(#colorLiteral(red: 0.1568627506494522, green: 0.16862745583057404, blue: 0.1921568661928177, alpha: 1)))
                                .frame(width: 390, height: 250)
                            //system / light / status ba...
                            
                            
                            
                            VStack{
                                senderView(senderName: from, user: to, email: email)
                                    .padding(.leading, -50).frame(width: 390, height: 205)
                                    .offset(y : -10)
                                //Articles about flat Earth theory.
                                Text(summaryData.subject).font(.custom("Arial Bold", size: 26.1)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.leading).tracking(1.7).lineSpacing(6)
                                    .offset(y:-60)
                                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                                    .truncationMode(.tail)
                                    .padding(.horizontal)
                            }
                        }
                        
                        Text(summaryData.summary)
                            .frame(width: 370, height: 200)
                            .padding()
                            .border(Color.clear, width: 1)
                        
                        NavigationLink {
                            openMailScreen(email: email)
                        } label: {
                            voiceMail(email: summaryData)
                                .padding(.bottom, 30.0)
                                .padding(.horizontal)
                        }

                        
                        Button(action: {
                            showSplitSheet = true
                        }, label: {
                            voiceButtons(option1: "Reply", option2: "Reply All", option3: "Forward")
                        })
                           
                        
                        
                        
                        ZStack{
                            //Rectangle 15
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(#colorLiteral(red: 0.1568627506494522, green: 0.16862745583057404, blue: 0.1921568661928177, alpha: 1)))
                                .frame(height: 300)
                            
                            VStack(alignment: .leading) {
                                
                                //Related Mails
                                Text("Related Mails").font(.custom("Arial Bold", size: 15)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.leading).padding([.leading, .bottom])
                                
                                Related_Mails()
                                Related_Mails()
                                Related_Mails()
                                
                            }
                            .padding(.all)
                        }
                        .padding(.horizontal, 1.0)
                        
                        
                    }
                }
            }
            .sheet(isPresented: $showSplitSheet,
                   content: {
                composemail(toRecipient: from, fromSender: to, subject: summaryData.subject, email: summaryData)
            })
        }
    }
    
    var from: String {
        for header in email.payload.headers {
            if header.name == "From" {
               let components = header.value.components(separatedBy: "<")
                
                return components[0]
            }
        }
        return "Invalid Sender"
    }
    
    var to: String {
        for header in email.payload.headers {
            if header.name == "To" {
                return header.value
            }
        }
        return "Invalid Reciever"
    }
}
//#Preview {
//    RelatedMailScreen()
//}
