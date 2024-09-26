//
//  InformationView.swift
//  spaceX
//
//  Created by Максим Жуин on 24.09.2024.
//

import SwiftUI

struct InformationView: View {

    @Binding var responseModel: ResponseModel
    @State private var isSheetpresented = false

    var body: some View {
        Group {
                ScrollView {
                    HStack {
                        Text("\(responseModel.name)")
                            .font(.title)
                            .foregroundStyle(.white)
                        Spacer()
                        Button(action: {
                            isSheetpresented.toggle()
                        }) {
                            Image(systemName: "gearshape", variableValue: nil)
                                .resizable()
                                .foregroundStyle(.white)
                                .frame(width: 35, height: 35)
                        }
                    }
                    .padding([.leading, .trailing], 25)
                    .padding(.top, 30)
                    ScrollView(.horizontal) {
                        HStack {
                            ZStack {
                                Rectangle().foregroundStyle(.red)
                                    .frame(width: 150, height: 120)
                                    .cornerRadius(20)
                                VStack {
                                    Text("\(responseModel.height.meters!)")
                                        .font(.caption2)
                                    Text("Высота")
                                        .font(.caption2)
                                }
                            }
                            ZStack {
                                Rectangle().foregroundStyle(.white)
                                    .frame(width: 150, height: 120)
                                    .cornerRadius(20)
                                VStack {
                                    Text("\(responseModel.diamter.meters!)")
                                    Text("Диаметр")
                                }
                            }
                            ZStack {
                                Rectangle().foregroundStyle(.yellow)
                                    .frame(width: 150, height: 120)
                                    .cornerRadius(20)
                                VStack {
                                    Text("\(responseModel.mass.kg!)")
                                    Text("Масса")
                                }
                            }
                            ZStack {
                                Rectangle().foregroundStyle(.green)
                                    .frame(width: 150, height: 120)
                                    .cornerRadius(20)
                                VStack {
                                    Text("\(responseModel.payloadWeight.first!.kg)")
                                    Text("Полезная нагрузка")
                                }
                            }
                        }
                    }
                    .padding(.top, 10)
                    .scrollIndicators(.hidden)
                    VStack {
                        HStack {
                            Text(verbatim: "Дата первого запуска")
                                .foregroundStyle(.white)
                            Spacer()
                            Text(verbatim: "\(responseModel.firstFlight)")
                                .foregroundStyle(.white)
                        }
                        .padding([.leading, .trailing], 20)
                        Divider()
                            .overlay(.white)
                            .padding([.leading, .trailing], 20)
                        HStack {
                            Text(verbatim: "Страна")
                                .foregroundStyle(.white)
                            Spacer()
                            Text(verbatim: "\(responseModel.country)")
                                .foregroundStyle(.white)
                        }
                        .padding([.leading, .trailing], 20)
                        Divider()
                            .overlay(.white)
                            .padding([.leading, .trailing], 20)
                        HStack {
                            Text(verbatim: "Стоимость запуска")
                                .foregroundStyle(.white)
                            Spacer()
                            Text(verbatim: "\(responseModel.costPerLaunch)")
                                .foregroundStyle(.white)
                        }
                        .padding([.leading, .trailing], 20)
                        Divider()
                            .overlay(.white)
                            .padding([.leading, .trailing], 20)

                    }
                    .padding(.top, 20)
                    Text("Первая Ступень")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding(.leading, 15)
                        .padding(.trailing, 150)
                        .padding(.top, 20)
                    VStack {
                        HStack {
                            Text(verbatim: "Количество двигателей")
                                .foregroundStyle(.white)
                            Spacer()
                            Text(verbatim: "Test Text2")
                                .foregroundStyle(.white)
                        }
                        .padding([.leading, .trailing], 20)
                        Divider()
                            .overlay(.white)
                            .padding([.leading, .trailing], 20)
                        HStack {
                            Text(verbatim: "Количество топлива, tn")
                                .foregroundStyle(.white)
                            Spacer()
                            Text(verbatim: "Test Text4")
                                .foregroundStyle(.white)
                        }
                        .padding([.leading, .trailing], 20)
                        Divider()
                            .overlay(.white)
                            .padding([.leading, .trailing], 20)
                        HStack {
                            Text(verbatim: "Время сгорания, sec")
                                .foregroundStyle(.white)
                            Spacer()
                            Text(verbatim: "Test Text6")
                                .foregroundStyle(.white)
                        }
                        .padding([.leading, .trailing], 20)
                        Divider()
                            .overlay(.white)
                            .padding([.leading, .trailing], 20)
                    }
                    .padding(.top, 20)
                    Text("Вторая Ступень")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding(.leading, 15)
                        .padding(.trailing, 150)
                        .padding(.top, 20)
                    VStack {
                        HStack {
                            Text(verbatim: "Количество двигателей")
                                .foregroundStyle(.white)
                            Spacer()
                            Text(verbatim: "Test Text2")
                                .foregroundStyle(.white)
                        }
                        .padding([.leading, .trailing], 20)
                        Divider()
                            .overlay(.white)
                            .padding([.leading, .trailing], 20)
                        HStack {
                            Text(verbatim: "Количество топлива, tn")
                                .foregroundStyle(.white)
                            Spacer()
                            Text(verbatim: "Test Text4")
                                .foregroundStyle(.white)
                        }
                        .padding([.leading, .trailing], 20)
                        Divider()
                            .overlay(.white)
                            .padding([.leading, .trailing], 20)
                        HStack {
                            Text(verbatim: "Время сгорания, sec")
                                .foregroundStyle(.white)
                            Spacer()
                            Text(verbatim: "Test Text6")
                                .foregroundStyle(.white)
                        }
                        .padding([.leading, .trailing], 20)
                    }
                    .padding(.top, 20)
                }
            }
            .background(.black)
            }
}

#Preview {
    @State var sample = ResponseModel(height: ResponseModelParam(meters: 140.0, feet: 142.0), diamter: ResponseModelParam(meters: 122.0, feet: 105.0), firstStage: ResponseModelFirstStage(engines: 2, fuelAmountTons: 140.0, burnTimeSeconds: 10.0), secondStage: ResponseModelSecondStage(engines: 4, fueldAmountTons: 45.0, burnTimeSeconds: 34.0), payloadWeight: [ResponseModelPayloadWeight(id: "12", name: "Paylod", kg: 144.0, lb: 152.0)], flickImages: ["https://"], name: "NameFirst", type: "TypeRocket", costPerLaunch: 160.0, successratePct: 12.0, firstFlight: "12.05.1994", country: "USA", company: "NETFLIX", description: "Descr", mass: ResponseModelMass(kg: 144.0, lb: 152.0))
    InformationView(responseModel: $sample)
}
