//
//  SeatAlertView.swift
//  WhereSeat_iOS
//
//  Created by 드즈 on 2023/07/04.
//

import SwiftUI

struct SeatAlertView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var show: Bool
    
    var stadium: StadiumModel
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                VStack(spacing: 20) {
                    Text(stadium.name)
                        .font(.title)
                    Text("좌석을 선택하시겠습니까?")
                    Image("고척스카이돔")
                        .resizable()
                        .frame(width: 220, height: 330)
                        .clipped()
                    NavigationLink {
                        ReviewListView()
                    } label: {
                        Text("좌석 선택하러 가기")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 87)
                            .cornerRadius(10)
                            .background(
                                Color.mainColor
                            )
                    }
                }
                .padding(.vertical, 20)
                .padding(.horizontal, 30)
                .cornerRadius(25)
            }
            .cornerRadius(20)
        }
    }
}
