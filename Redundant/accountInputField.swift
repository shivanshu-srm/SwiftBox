//
//  accountInputField.swift
//  Swift-Box
//
//  Created by Subha on 02/01/24.
//

import SwiftUI

struct accountInputField: View {
    
    let field: String
    
    var body: some View {
        
        ZStack {

        //Rectangle 2
            RoundedRectangle(cornerRadius: 21)
            .fill(Color(#colorLiteral(red: 0.9750000238418579, green: 0.9750000238418579, blue: 0.9750000238418579, alpha: 0.8299999833106995)))
            .frame(width: 300, height: 47)
            
            //Username
                Text(field).font(.custom("Poppins Light", size: 15)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.38)))
        }
    }
}

#Preview {
    accountInputField(field: "Password")
}
