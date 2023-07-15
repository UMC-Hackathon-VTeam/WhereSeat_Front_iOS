//
//  SeatSelectView.swift
//  WhereSeat_iOS
//
//  Created by 드즈 on 2023/07/03.
//

import SwiftUI

struct SeatSelectView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var selectedSeat: SeatModel?
    
    @ObservedObject var viewModel = SeatViewModel()
    
    var body: some View {
        NavigationStack {
            Picker("", selection: $selectedSeat) {
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
