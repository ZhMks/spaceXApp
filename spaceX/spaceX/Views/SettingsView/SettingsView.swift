//
//  SettingsView.swift
//  spaceX
//
//  Created by Максим Жуин on 11.10.2024.
//

import SwiftUI


struct SettingsView: View {

    @Binding var heightState: HeightModelState
    @Binding var diameterState: DiameterModelState
    @Binding var massState: MassModelState
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            HStack {
                Text("Настройки")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .padding(.leading, 120)
                Text("Закрыть")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding(.leading, 80)
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding()
        }
    }

}
