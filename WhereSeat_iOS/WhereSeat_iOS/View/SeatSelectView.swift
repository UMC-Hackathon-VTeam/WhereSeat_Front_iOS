//
//  SeatSelectView.swift
//  WhereSeat_iOS
//
//  Created by 드즈 on 2023/07/03.
//

import SwiftUI

struct SeatSelectView: View {
    @ObservedObject var viewModel = SeatViewModel()
    @State private var selectedSeat: SeatModel?
    
    var body: some View {
        NavigationView {
            Picker("a", selection: $selectedSeat) {
                ForEach(viewModel.seat, id: \.self) { option in
                    Text(option.seat).tag(option)
                }
            }
            .pickerStyle(.inline)
            .navigationBarItems(leading: Text("좌석 선택").font(.system(size: 20, weight: .bold)))
        }
    }
}

struct SeatSelectView_Previews: PreviewProvider {
    static var previews: some View {
        SeatSelectView()
    }
}
