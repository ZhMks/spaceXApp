//
//  InformationView.swift
//  spaceX
//
//  Created by Максим Жуин on 24.09.2024.
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        Group {
            HStack {
                Text("Test Text")
                    .padding()
                    .foregroundStyle(.white)
                Spacer()
                Button(action: {

                }) {
                    Image(systemName: "gearshape", variableValue: nil)
                        .foregroundStyle(.white)
                }
            }
            .padding()
            ScrollView(.horizontal) {
                HStack {
                    Rectangle().foregroundStyle(.red)
                        .frame(width: 150, height: 120)
                        .cornerRadius(15)
                    Rectangle().foregroundStyle(.white)
                        .frame(width: 150, height: 120)
                        .cornerRadius(15)
                    Rectangle().foregroundStyle(.yellow)
                        .frame(width: 150, height: 120)
                        .cornerRadius(15)
                    Rectangle().foregroundStyle(.green)
                        .frame(width: 150, height: 120)
                        .cornerRadius(15)
                }
            }
            .scrollIndicators(.hidden)
        }
        .background(.black)
    }
}

#Preview {
    InformationView()
}
