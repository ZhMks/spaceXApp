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

    var body: some View {
        VStack {
            Text("Settings")
                .navigationTitle("Настройки")
        }
    }

}
