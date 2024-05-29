//
//  hlloo.swift
//  Swift-Box
//
//  Created by user1 on 25/02/24.
//

import SwiftUI

struct composemail: View {
    @State var toRecipient: String
    @State var ccBccRecipient: String = ""
    @State var fromSender: String
    @State var subject: String
    @State var message: String = ""
    @State var showSplitSheet: Bool = false
    
    var email: SummaryData
    
    @ObservedObject var decoder = Decoder()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Group {
                    HStack{
                        Text("To:")
                        TextField("Recipient", text: $toRecipient)
                            .background(Color.clear) // Set background color to clear

                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Button(action: {
                                                    // Action to add recipient
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.blue)
                                .imageScale(.large)
                        }
                    }
                    Divider()
                    HStack{
                        Text("Cc/Bcc:")
                        TextField("Cc/Bcc", text: $ccBccRecipient)
                            .background(Color.clear) // Set background color to clear

                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    Divider()

                    
                    HStack{
                        
                        Text("Subject:")
                        TextField("Subject", text: $subject)
                            .background(Color.clear) // Set background color to clear

                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                
                Text("Message:")
                    .padding(.top, 10)
                    .padding(.bottom, 5)
                
                TextEditor(text: $decoder.generatedResponse)
                    .frame(minWidth: 10, maxWidth: 390, minHeight: 200)
                    .padding()
                    .border(Color.clear, width: 1)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        
                        decoder.fetchResponse(for: email.HTMLbody, responseType: .acceptance)
                        
                    }) {
                        Text(" Acceptance   ")
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray))
                    }
                    
                    Button(action: {
                        decoder.fetchResponse(for: email.HTMLbody, responseType: .restructuring)
                    }) {
                        Text(" Restructuring ")
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray))
                    }
                    
                    Spacer()
                }
                .padding(.bottom)
                
                
            }
            .navigationBarTitle(subject.isEmpty ? "New Message" : subject, displayMode: .automatic)
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {
                        // Action to send the message
                    }) {
                        Text("Save Draft")
                            .padding(.horizontal)
                            .offset(x:20)
                    }
                
                    
                    Button(action: {
                        self.showSplitSheet = false// Action to save the message as a draft
                    }) {
                        Text("Send")
                            .padding(.horizontal)
                            .font(.custom("Inter Regular", size: 20))
                            .foregroundColor(Color.white)
                            .tracking(0.33)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 1)
                            .padding(.vertical, 6)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                    }
                   
                }
            )
            .padding()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        composemail()
//    }
//}
