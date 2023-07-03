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
                Image(review.image)
                    .padding()
                HStack {
                    Image("user")
                        .padding(.leading)
                    Text(review.userName)
                        .foregroundColor(Color("Purple"))
                    Spacer()
                    StarView(rating: Int(review.score), size: 15)
                        .padding(.trailing)
                }
                HStack{
                    Text(review.content)
                        .padding()
                    Spacer()
                }
                Spacer()
                HStack{
                    Button(action: {}){
                        HStack{
                            Text("이 리뷰 신고하기")
                                .foregroundColor(.gray)
                                .underline()
                                .padding()
                            Spacer()
                        }
                    }
                }
            }
        }.navigationBarTitle(review.seat, displayMode: .inline)
    }
}


struct ReviewContentView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewListView()
    }
}
