//
//  HomeView.swift
//  WhereSeat_iOS
//
//  Created by Phil on 2023/07/03.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.stadium) { stadium in
                    NavigationLink(destination: ReviewListView()) {
                        StadiumCellView(stadium: stadium)
                            .padding()
                    }
                }
            }.navigationTitle("홈")
            .scrollIndicators(.hidden)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

