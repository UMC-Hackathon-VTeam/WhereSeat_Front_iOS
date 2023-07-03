//
//  ReviewListView.swift
//  WhereSeat_iOS
//
//  Created by Phil on 2023/07/03.
//

import SwiftUI

struct ReviewListView: View {
    @ObservedObject var viewModel = ReviewListViewModel()
    
    var body: some View {
        NavigationView{
            ZStack{
                ScrollView{
                    VStack{
                        ForEach(viewModel.reviewList, id: \.id) { review in
                            NavigationLink(destination: ReviewContentView(review: review)){
                                ReviewCellView(review: review)
                                    .padding(5)
                            }
                        }
                    }
                }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink(destination: AddReviewView()){
                            ZStack{
                                Circle().frame(width: 80,height: 80)
                                    .padding()
                                    .foregroundColor(.purple)
                                Image(systemName: "plus")
                                    .font(.system(size: 40))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
        }.navigationTitle("블루석")
    }
}

struct ReviewCellView : View {
    let review : Review
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.white)
            .frame(width: 330, height: 172)
            .shadow(radius: 5)
            .overlay(
                VStack {
                    HStack {
                        Image(review.image)
                            .resizable()
                            .frame(width: 122, height: 128)
                            .scaledToFill()
                            .padding(.leading)
                        VStack(alignment: .leading){
                            HStack{
                                Text (review.seat)
                                    .bold()
                                    .font(.system(size: 18))
                                Spacer()
                            }
                            StarView(rating: Int(review.score))
                                .padding(.bottom)
                            Text(review.content)
                            
                        }
                    }
                }
                    .foregroundColor(.black)
            )
    }
}


struct ReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewListView()
    }
}
