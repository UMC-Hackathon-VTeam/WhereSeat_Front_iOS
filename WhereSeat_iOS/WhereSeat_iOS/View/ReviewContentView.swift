//
//  ReviewContentView.swift
//  WhereSeat_iOS
//
//  Created by Phil on 2023/07/03.
//

import SwiftUI

struct ReviewContentView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let review: Review
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(review.image)
                    .padding()
                
                HStack {
                    Image("user")
                        .padding(.leading)
                    Text(review.userName)
                        .foregroundColor(.purple)
                    
                    Spacer()
                    
                    StarView(rating: Int(review.score), size: 18)
                        .padding(.trailing)
                }
                
                HStack {
                    Text(review.content)
                        .padding()
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Button {
                        
                    } label: {
                        Text("이 리뷰 신고하기")
                            .foregroundColor(.gray)
                            .underline()
                            .padding()
                    }
                }
            }
        }
        .navigationBarTitle(review.seat, displayMode: .inline)
    }
}

struct ReviewContentView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewListView()
    }
}
