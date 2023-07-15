//
//  ReviewListView.swift
//  WhereSeat_iOS
//
//  Created by Phil on 2023/07/03.
//

import SwiftUI

struct ReviewListView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var viewModel = ReviewListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack {
                        ForEach(viewModel.reviewList, id: \.id) { review in
                            NavigationLink(destination: ReviewContentView(review: review)) {
                                ReviewCellView(review: review)
                                    .padding(10)
                            }
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: AddReviewView()) {
                            ZStack {
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
            .navigationBarTitle("고척 스카이돔",displayMode: .inline)
        }
    }
}

struct ReviewCellView : View {
    let review : Review
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.white)
            .frame(height: 172)
            .shadow(radius: 5)
            .overlay(
                VStack {
                    HStack {
                        Image(review.image)
                            .resizable()
                            .frame(width: 122, height: 128)
                            .scaledToFill()
                            .padding(.leading)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text (review.seat)
                                    .bold()
                                    .font(.system(size: 18))
                                Spacer()
                            }
                            .padding(.bottom)
                            
                            StarView(rating: Int(review.score), size: 12)
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
