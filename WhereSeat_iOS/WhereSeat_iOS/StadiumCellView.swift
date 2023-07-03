//
//  StadiumCellView.swift
//  WhereSeat_iOS
//
//  Created by 드즈 on 2023/07/03.
//

import SwiftUI

struct StadiumCellView: View {
    let stadium: Stadium
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 327, height: 172)
                
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 4)
            }
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 327, height: 133)
                .background(
                    Image(stadium.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 327, height: 133)
                        .clipped()
                )
                .cornerRadius(10)
        }
    }
}
/*
struct StadiumCellView_Previews: PreviewProvider {
    static var previews: some View {
        StadiumCellView(stadium: <#T##Stadium#>)
    }
}
*/
