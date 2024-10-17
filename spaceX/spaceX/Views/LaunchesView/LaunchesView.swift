//
//  LaunchesView.swift
//  spaceX
//
//  Created by Максим Жуин on 17.10.2024.
//
import SwiftUI


struct LaunchesView: View {
    var model: ResponseModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Text("LaunchesView")
            .navigationTitle("\(model.name)")
            .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left") // Custom back icon
                    Text("Назад") // Custom back text
                }
            })
    }
}
