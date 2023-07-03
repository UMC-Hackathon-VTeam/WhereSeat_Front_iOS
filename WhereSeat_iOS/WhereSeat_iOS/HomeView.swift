//
//  HomeView.swift
//  WhereSeat_iOS
//
//  Created by Phil on 2023/07/03.
//

import SwiftUI

struct HomeView: View {
    var stadium: [Stadium]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(stadium) { stadium in
                    NavigationLink(destination: SeatSelectView()) {
                        StadiumCellView(stadium: stadium)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}
/*
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(stadium: <#T##[Stadium]#>)
    }
}
*/
