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
            Color.black.ignoresSafeArea()
            HStack() {
                Text("Настройки")
                    .frame(width: 150, height: 40, alignment: .leading)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(.leading, 120)
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Назад")
                        .frame(width: 50, height: 20, alignment: .leading)
                        .padding(.leading, 30)
                        .foregroundStyle(.white)
                }
            }
            .padding(.bottom, 650)
            VStack {
                HStack(spacing: 100) {
                    Text("Высота")
                        .frame(width: 80, height: 60, alignment: .leading)
                        .font(.footnote)
                        .foregroundStyle(.white)
                        .padding(.leading, 15)
                    Picker("Select an option", selection: $heightState) {
                        ForEach(HeightModelState.allCases, id: \.self) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(.segmented)
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .circular))
                }
                HStack(spacing: 100) {
                    Text("Диаметр")
                        .frame(width: 80, height: 60, alignment: .leading)
                        .font(.footnote)
                        .foregroundStyle(.white)
                        .padding(.leading, 15)
                    Picker("Diameter", selection: $diameterState) {
                        ForEach(DiameterModelState.allCases, id: \.self) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(.segmented)
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .circular))
                }
                HStack(spacing: 100) {
                    Text("Масса")
                        .frame(width: 80, height: 60, alignment: .leading)
                        .font(.footnote)
                        .foregroundStyle(.white)
                        .padding(.leading, 15)
                    Picker("Mass", selection: $massState) {
                        ForEach(MassModelState.allCases, id: \.self) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(.segmented)
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .circular))
                }
            }
            .frame(width: 300, height: 200)
            .padding(.leading, 40)
            .padding(.bottom, 320)
        }
    }
    
}

struct LaunchesContentPreview: PreviewProvider {
    @State static var heightState: HeightModelState = .ft
    @State static var massState: MassModelState = .kg
    @State static var diameterState: DiameterModelState = .ft
    static var previews: some View {
        SettingsView(heightState: $heightState, diameterState: $diameterState, massState: $massState)
    }
}
