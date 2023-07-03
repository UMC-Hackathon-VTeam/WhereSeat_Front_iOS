//
//  SeatAlertView.swift
//  WhereSeat_iOS
//
//  Created by 드즈 on 2023/07/04.
//

import SwiftUI

struct SeatAlertView: View {
    @Binding var show: Bool
    
    var stadium: StadiumModel
    
    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                VStack(spacing: 20) {
                    Text(stadium.name)
                        .font(.title)
                    Text("좌석을 선택하시겠습니까?")
                    Image("고척스카이돔"/*stadium.image*/)
                        .resizable()
                        .frame(width: 220, height: 330)
                        .clipped()
                    NavigationLink {
                        SeatSelectView()
                    } label: {
                        Text("좌석 선택하러 가기")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 87)
                            .background(
                                Color.purple
                            )
                            .cornerRadius(10)
                    }
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 30)
                .cornerRadius(25)
                
                Button {
                    show = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .padding(.horizontal, 20)
                }
            }
            .cornerRadius(20)
        }
    }
}
