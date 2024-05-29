import SwiftUI
import GoogleSignIn

struct SettingsView: View {
    @State private var autoreply = true
    @State private var mailrules = true
    @State private var mailforwarding = false
    @State private var useofthisiphone = true

    @State private var mailbehaviour = false
    
    @State private var selectedTheme = 0
    let themes = ["Light", "Dark", "System"]
    
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    private var user: GIDGoogleUser? {
        return GIDSignIn.sharedInstance.currentUser
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                   
                    ZStack{// Gray box with corner radius and text
                        Rectangle()
                            .foregroundColor(Color.clear)
                            .frame(height: 200) // Adjust height to fit your design
                            .cornerRadius(20)
                        VStack{
                            Image("LOGO")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .offset(y:-10)
                            
                            Text("SwiftBox")
                                .font(.custom("Arial Bold", size: 22))
                                .offset(y:-10)
                            
                            //Use your existing iCloud M...
                            Text("Use your existing iCloud Mail account on this iPhone or \tset up a free “@icloud.com” email address. \n").font(.system(size: 12, weight: .regular))
                                .offset(y:10)
                                .frame(alignment: .center)
                            
                            Text("Learn More ").font(.system(size: 12, weight: .regular)).foregroundColor(Color(#colorLiteral(red: 0.12, green: 0.37, blue: 0.94, alpha: 1)))
                            
                            Section() {
                                Toggle("Use of this iPhone", isOn: $useofthisiphone)
                                    .offset(y:15)
                            }
                               
                        }
                        
                    }
                    
                    Section(header: Text("ACCOUNT INFORMATION")) {
                        
                        HStack{//Title
                            Text("Email").font(.system(size: 17, weight: .regular)).tracking(-0.4)
                            
                            Spacer()
                            //Detail
                            //Detail
                            Text(user?.profile?.email ?? "No User Signed In").font(.system(size: 17, weight: .regular)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8))).tracking(-0.4).multilineTextAlignment(.trailing)
                            Image("arrowright")
                        }
                        
                        HStack{//Title
                            Text("Addresses").font(.system(size: 17, weight: .regular)).tracking(-0.4)
                            
                            Spacer()
                            //Detail
                            //Detail
                            Text("1").font(.system(size: 17, weight: .regular)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8))).tracking(-0.4).multilineTextAlignment(.trailing)
                            Image("arrowright")
                        }
                    }
                    // Set text color
                    
                    
                    // Form content
                    
                    Section() {
                        Toggle("Auto-reply", isOn: $autoreply)
                        Toggle("iCloud Mail Rules", isOn: $mailrules)
                        Toggle("Mail forwarding", isOn: $mailforwarding)
                        Toggle("Mailbox Behaviors", isOn: $mailbehaviour)
                        
                    }
                        
                        
                        Section(header: Text("SECURITY")) {
                            
                            HStack{//Title
                                Text("Signing and Encryption").font(.system(size: 17, weight: .regular)).tracking(-0.4)
                                
                                Spacer()
                                //Detail
                                //Detail
                                
                                Image("arrowright")
                            }
                        }
                        
                        Section(header: Text("Account")) {
                            Button(action: {
                                authViewModel.signOut()
                            }) {
                                Text("Sign Out")
                            }
                        }
                    }
                    .navigationTitle("Settings")
                }
            }
        }
    }
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
                .environmentObject(AuthenticationViewModel())
        }
    }
