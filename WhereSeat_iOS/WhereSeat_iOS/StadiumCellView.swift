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
        VStack(spacing: 0){
            Image(stadium.image)
                .resizable()
                .frame(width: 327, height: 133)
                .scaledToFit()
                .shadow(radius: 5)
                
            Rectangle()
                .frame(width: 327, height: 39)
                .foregroundColor(.white)
                .overlay(Text(stadium.name).foregroundColor(.black))
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
