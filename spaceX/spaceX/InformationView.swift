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
            ScrollView{
                HStack {
                    Text("Test Text")
                        .font(.title)
                        .foregroundStyle(.white)
                    Spacer()
                    Button(action: {

                    }) {
                        Image(systemName: "gearshape", variableValue: nil)
                            .resizable()
                            .foregroundStyle(.white)
                    }
                    .frame(width: 45, height: 45)
                }
                .padding([.leading, .trailing], 25)
                .padding(.top, 30)
                ScrollView(.horizontal) {
                    HStack {
                        Rectangle().foregroundStyle(.red)
                            .frame(width: 150, height: 120)
                            .cornerRadius(20)
                        Rectangle().foregroundStyle(.white)
                            .frame(width: 150, height: 120)
                            .cornerRadius(20)
                        Rectangle().foregroundStyle(.yellow)
                            .frame(width: 150, height: 120)
                            .cornerRadius(20)
                        Rectangle().foregroundStyle(.green)
                            .frame(width: 150, height: 120)
                            .cornerRadius(20)
                    }
                }
                .padding(.top, 10)
                .scrollIndicators(.hidden)
                VStack {
                    HStack {
                        Text(verbatim: "Test Text1")
                            .foregroundStyle(.white)
                        Spacer()
                        Text(verbatim: "Test Text2")
                            .foregroundStyle(.white)
                    }
                    .padding([.leading, .trailing], 10)
                    Divider()
                        .overlay(.white)
                        .padding([.leading, .trailing], 10)
                    HStack {
                        Text(verbatim: "Test Text3")
                            .foregroundStyle(.white)
                        Spacer()
                        Text(verbatim: "Test Text4")
                            .foregroundStyle(.white)
                    }
                    .padding([.leading, .trailing], 10)
                    Divider()
                        .overlay(.white)
                        .padding([.leading, .trailing], 10)
                    HStack {
                        Text(verbatim: "Test Text5")
                            .foregroundStyle(.white)
                        Spacer()
                        Text(verbatim: "Test Text6")
                            .foregroundStyle(.white)
                    }
                    .padding([.leading, .trailing], 10)
                    Divider()
                        .overlay(.white)
                        .padding([.leading, .trailing], 10)

                }
                .padding(.top, 20)
                VStack {
                    HStack {
                        Text(verbatim: "Test Text1")
                            .foregroundStyle(.white)
                        Spacer()
                        Text(verbatim: "Test Text2")
                            .foregroundStyle(.white)
                    }
                    .padding([.leading, .trailing], 10)
                    Divider()
                        .overlay(.white)
                        .padding([.leading, .trailing], 10)
                    HStack {
                        Text(verbatim: "Test Text3")
                            .foregroundStyle(.white)
                        Spacer()
                        Text(verbatim: "Test Text4")
                            .foregroundStyle(.white)
                    }
                    .padding([.leading, .trailing], 10)
                    Divider()
                        .overlay(.white)
                        .padding([.leading, .trailing], 10)
                    HStack {
                        Text(verbatim: "Test Text5")
                            .foregroundStyle(.white)
                        Spacer()
                        Text(verbatim: "Test Text6")
                            .foregroundStyle(.white)
                    }
                    .padding([.leading, .trailing], 10)
                    Divider()
                        .overlay(.white)
                        .padding([.leading, .trailing], 10)
                    HStack {
                        Text(verbatim: "Test Text5")
                            .foregroundStyle(.white)
                        Spacer()
                        Text(verbatim: "Test Text6")
                            .foregroundStyle(.white)
                    }
                    .padding([.leading, .trailing], 10)
                    Divider()
                        .overlay(.white)
                        .padding([.leading, .trailing], 10)
                    HStack {
                        Text(verbatim: "Test Text7")
                            .foregroundStyle(.white)
                        Spacer()
                        Text(verbatim: "Test Text8")
                            .foregroundStyle(.white)
                    }
                    .padding([.leading, .trailing], 10)
                    Divider()
                        .overlay(.white)
                        .padding([.leading, .trailing], 10)
                    HStack {
                        Text(verbatim: "Test Text9")
                            .foregroundStyle(.white)
                        Spacer()
                        Text(verbatim: "Test Text10")
                            .foregroundStyle(.white)
                    }
                    .padding([.leading, .trailing], 10)
                    Divider()
                        .overlay(.white)
                        .padding([.leading, .trailing], 10)

                }
                .padding(.top, 20)
            }
        }
        .background(.black)
    }
}

#Preview {
    InformationView()
}
