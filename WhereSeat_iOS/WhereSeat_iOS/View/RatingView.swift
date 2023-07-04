//
//  RatingView.swift
//  WhereSeat_iOS
//
//  Created by 드즈 on 2023/07/05.
//

import SwiftUI

struct RatingView : View {
    @Binding var rating: Int
       
       var body: some View {
           HStack {
               ForEach(1...5, id: \.self) { index in
                   Image(systemName: index <= rating ? "star.fill" : "star")
                       .foregroundColor(index <= rating ? .yellow : .gray)
                       .font(.system(size: 35))
                       .onTapGesture {
                           rating = index
                       }
               }
           }
       }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: Binding.constant(0))
    }
}
