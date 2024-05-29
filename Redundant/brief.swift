//
//  brief.swift
//  Swift-Box
//
//  Created by SHIVANSHU DIXIT on 19/01/24.
//

import SwiftUI

struct brief: View {
    var body: some View {
        //Brief 20122022 - 2MB
        Text("Brief 20122022 - 2MB").font(.custom("Inter Medium", size: 14)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).lineSpacing(15).frame(width: 370, alignment: .leading)
    }
}

#Preview {
    brief()
}
