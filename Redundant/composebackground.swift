//
//  composebackground.swift
//  Swift-Box
//
//  Created by SHIVANSHU DIXIT on 19/01/24.
//

import SwiftUI

struct composebackground: View {
    var body: some View {
        //Rectangle 15
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(#colorLiteral(red: 0.1568627506494522, green: 0.16862745583057404, blue: 0.1921568661928177, alpha: 1)))
        .frame(width: 390, height: 479)
        //Ellipse 5
        Circle()
            .fill(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.30000001192092896)))
        .frame(width: 48, height: 48)
        //maximize-3
       }
}

#Preview {
    composebackground()
}
