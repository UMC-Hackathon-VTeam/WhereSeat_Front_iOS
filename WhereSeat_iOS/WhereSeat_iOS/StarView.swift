//
//  StarView.swift
//  WhereSeat_iOS
//
//  Created by Phil on 2023/07/03.
//

import SwiftUI

struct StarView : View {
    let rating: Int
       var body: some View {
           HStack(spacing: 1) {
               ForEach(1...5, id: \.self) { index in
                   Image(systemName: index <= rating ? "star.fill" : "star")
                       .foregroundColor(index <= rating ? .yellow : .gray)
                       .font(.system(size: 16))

               }
           }
       }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView(rating: 5)
    }
}
