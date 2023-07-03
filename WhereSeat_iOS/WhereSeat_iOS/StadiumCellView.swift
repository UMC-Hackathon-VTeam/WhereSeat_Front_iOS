//
//  StadiumCellView.swift
//  WhereSeat_iOS
//
//  Created by 드즈 on 2023/07/03.
//

import SwiftUI

struct StadiumCellView: View {
    let stadium: StadiumModel
    
    var body: some View {
        
        VStack(spacing: 1){
            Image(stadium.image)
                .resizable()
                .frame(width: 327, height: 133)
                .scaledToFit()
                .shadow(radius: 5)

            Rectangle()
                .frame(width: 327, height: 39)
                .foregroundColor(.white)
                .shadow(radius: 5)
                .overlay(
                    HStack{
                        Text(stadium.name)
                            .foregroundColor(.black)
                            .bold()
                            .padding()
                        Spacer()
                    }
                )
        }
    }
}

struct StadiumCellView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

