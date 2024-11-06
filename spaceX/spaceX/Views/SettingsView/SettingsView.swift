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
        VStack {
            HStack(spacing: 120) {
                Text("Настройки")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Назад")
                        .foregroundStyle(.black)
                }
            }
            VStack {
                HStack {
                    Text("Высота")
                        .frame(width: 80, height: 60, alignment: .leading)
                        .font(.footnote)
                        .foregroundStyle(.black)
                        .padding(.leading, 15)
                    Picker("Select an option", selection: $heightState) {
                        ForEach(HeightModelState.allCases, id: \.self) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .circular))
                    .frame(width: 150, height: 50)
                }
                HStack {
                    Text("Диаметр")
                        .frame(width: 80, height: 60, alignment: .leading)
                        .font(.footnote)
                        .foregroundStyle(.black)
                        .padding(.leading, 15)
                    Picker("Diameter", selection: $diameterState) {
                        ForEach(DiameterModelState.allCases, id: \.self) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(.segmented)
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .circular))
                    .frame(width: 150, height: 40)
                }
                HStack {
                    Text("Масса")
                        .frame(width: 80, height: 60, alignment: .leading)
                        .font(.footnote)
                        .foregroundStyle(.black)
                        .padding(.leading, 15)
                    Picker("Mass", selection: $massState) {
                        ForEach(MassModelState.allCases, id: \.self) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(.segmented)
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .circular))
                    .frame(width: 150, height: 50)
                    .border(.green)
                }
            }
        }
    }
    
}

struct LaunchesContentPreview: PreviewProvider {
    @State static var heightState: HeightModelState = .feet
    @State static var massState: MassModelState = .kg
    @State static var diameterState: DiameterModelState = .feet
    static var previews: some View {
        SettingsView(heightState: $heightState, diameterState: $diameterState, massState: $massState)
    }
}
