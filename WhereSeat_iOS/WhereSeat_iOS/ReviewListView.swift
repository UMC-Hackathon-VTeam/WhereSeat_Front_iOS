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
                VStack{
                    ForEach(viewModel.reviewList, id: \.id) { review in
                        NavigationLink(destination: ReviewContentView(review: review)){
                            ReviewCellView(review: review)
                        }
                    }
                }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {}){
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
        }
    }
}

struct ReviewCellView : View {
    let review : Review
    var body: some View {
        NavigationView {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .frame(width: 330, height: 172)
                    .shadow(radius: 5)
                VStack {
                    HStack{
                        Image(review.image)
                            .frame(width: 122, height: 128)
                            .scaledToFill()
                            .padding()
                        VStack{
                            Text (review.seat)
                            Text (String(review.score))
                            Text(review.content)
                        }
                    }
                }
                .foregroundColor(.black)
            }
        }.navigationTitle(review.area)
    }
}


struct ReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewListView()
    }
}
