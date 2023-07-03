//
//  AddReviewView.swift
//  WhereSeat_iOS
//
//  Created by Phil on 2023/07/03.
//

import SwiftUI

struct AddReviewView: View {
    @State var seatNumber : String = ""
    @State private var rating = 0
    @State var reviewContent : String = ""
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    Spacer()
                    Button(action: {}){
                        Image("photo")
                            .padding(.top)
                    }
                    Text("좌석에 대한 사진을 남겨주세요(필수)")
                        .font(.system(size: 15))
                    HStack{
                        Text("좌석 입력")
                            .padding()
                        Spacer()
                    }
                    TextField("앉은 좌석 번호를 입력해주세요", text: $seatNumber)
                        .frame(height: 60)
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.white, lineWidth: 1) // Optional: Add a border stroke for better visibility
                                )
                        )
                        .padding(.horizontal)
                        .padding(.bottom)
                    HStack{
                        Text("별점 선택")
                            .padding()
                        Spacer()
                    }
                    RatingView(rating: $rating)
                        .font(.largeTitle)
                        .padding()
                    
                    HStack{
                        Text("리뷰 작성")
                            .padding()
                        Spacer()
                    }
                    TextField("좌석에 대한 리뷰를 작성 해주세요", text: $reviewContent)
                        .frame(height: 150)
                        .padding(.horizontal)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.white, lineWidth: 1) // Optional: Add a border stroke for better visibility
                                )
                        )
                        .padding(.horizontal)
                        .padding(.bottom)
                    
                    Button(action: {}){
                        RoundedRectangle(cornerRadius: 20)
                            .overlay(
                                Text("작성 완료하기").foregroundColor(.white)
                            )
                    }
                    .foregroundColor(Color("Purple"))
                    .frame(height: 50)
                    .padding()
                }
                }.background(Color.gray.opacity(0.2)
                    .edgesIgnoringSafeArea(.all))
            }.navigationBarTitle("리뷰 작성하기", displayMode: .inline)
        }

//    func saveReview (_ seatNumber : String, _ reviewContent : String) {
//           print("save review")
//    }
}

struct RatingView : View {
    @Binding var rating: Int
       
       var body: some View {
           HStack {
               ForEach(1...5, id: \.self) { index in
                   Image(systemName: index <= rating ? "star.fill" : "star")
                       .foregroundColor(index <= rating ? .yellow : .gray)
                       .font(.system(size: 20))
                       .onTapGesture {
                           rating = index
                       }
               }
           }
       }
}

struct AddReviewView_Previews: PreviewProvider {
    static var previews: some View {
        AddReviewView()
    }
}
