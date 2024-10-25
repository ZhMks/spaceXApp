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
                    .foregroundStyle(.white)
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Назад")
                        .foregroundStyle(.white)
                }
            }
            VStack {
                Picker("Height", selection: $heightState) {
                    Text("meters").tag(0)
                        .overlay(.white)
                    Text("feet").tag(1)
                        .tint(.white)
                }
                .pickerStyle(.segmented)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .circular))
                .frame(width: 150, height: 50)
                Picker("Diameter", selection: $heightState) {
                    Text("meters").tag(0)
                        .overlay(.white)
                    Text("feet").tag(1)
                        .tint(.white)
                }
                .pickerStyle(.segmented)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .circular))
                .frame(width: 150, height: 40)
                Picker("Mass", selection: $heightState) {
                    Text("kg").tag(0)
                        .overlay(.white)
                    Text("lbs").tag(1)
                        .tint(.white)
                }
                .pickerStyle(.segmented)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .circular))
                .frame(width: 150, height: 50)
            }
        }
    }

}

struct LaunchesContentPreview: PreviewProvider {
    static var previews: some View {
        @State var heightModel: HeightModelState = .feet
        @State var diameterModel: DiameterModelState = .meters
        @State var massModel: MassModelState = .kg
        SettingsView(heightState: $heightModel, diameterState: $diameterModel, massState: $massModel)
    }
}
