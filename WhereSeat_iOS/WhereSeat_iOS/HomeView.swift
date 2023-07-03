//
//  HomeView.swift
//  WhereSeat_iOS
//
//  Created by Phil on 2023/07/03.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State var showingAlert = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.stadium) { stadium in
                    StadiumCellView(stadium: stadium)
                        .onTapGesture {
                            showingAlert = true
                        }
                    /*
                    NavigationLink {
                        AlertView(show: $showingAlert, stadium: stadium)
                    } label: {
                        StadiumCellView(stadium: stadium)
                    }
                    */
                    .sheet(isPresented: $showingAlert) {
                            AlertView(show: $showingAlert, stadium: stadium)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .navigationBarItems(leading: Text("홈").font(.system(size: 20, weight: .bold)))
            
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
