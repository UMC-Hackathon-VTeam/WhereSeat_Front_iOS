//
//  ReviewContentView.swift
//  WhereSeat_iOS
//
//  Created by Phil on 2023/07/03.
//

import SwiftUI

struct ReviewContentView: View {
    let review: Review
    var body: some View {
        NavigationView {
            VStack{
                Image("Review")
                HStack {
                    Text("username")
                    Text("star")
                }
                Text("리뷰내용")
                Button(action: {}){
                    Text("이 게시물 신고하기")
                }
            }
        }.navigationTitle(review.seat)
    }
}

struct ReviewContentView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewListView()
    }
}
