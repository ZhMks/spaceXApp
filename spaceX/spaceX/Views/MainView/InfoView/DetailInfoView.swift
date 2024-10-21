//
//  DetailInfoView.swift
//  spaceX
//
//  Created by Максим Жуин on 10.10.2024.
//
import SwiftUI

struct DetailInfoView: View {

    var model: ResponseModel

    @State private var isPresented = false
    @State  var heightState: HeightModelState
    @State  var diameterState: DiameterModelState
    @State  var massState: MassModelState
    @State private var isSettingsAtive = false

    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 200) {
                    Text(model.name)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .tracking(2.0)
                        .font(.title2)
                        .padding(.leading, 10)
                    Button {
                        isSettingsAtive.toggle()
                    } label: {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundStyle(.white)
                    }

                }
                .padding(.bottom, 20)
                Group {
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 100, height: 100)
                                    .background(.gray)
                                    .opacity(0.6)
                                    .cornerRadius(30.0)
                                VStack {
                                    Text("\(model.height.meters ?? 0)")
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                    Text("Высота, \(heightState.rawValue)")
                                        .font(.caption2)
                                        .foregroundStyle(.white)
                                }
                            }
                            .padding(.trailing, 10)
                            ZStack {
                                Rectangle()
                                    .frame(width: 100, height: 100)
                                    .background(.gray)
                                    .opacity(0.6)
                                    .cornerRadius(30.0)
                                VStack {
                                    Text("\(model.diamter.meters ?? 0)")
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                    Text("Диметр, \(diameterState.rawValue)")
                                        .font(.caption2)
                                        .foregroundStyle(.white)
                                }
                            }
                            .padding(.trailing, 10)
                            ZStack {
                                Rectangle()
                                    .frame(width: 100, height: 100)
                                    .background(.gray)
                                    .opacity(0.6)
                                    .cornerRadius(30.0)
                                VStack {
                                    Text("\(model.mass.kg ?? 0)")
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                    Text("Масса, \(massState.rawValue)")
                                        .font(.caption2)
                                        .foregroundStyle(.white)
                                }
                            }
                            .padding(.trailing, 10)
                            ZStack {
                                Rectangle()
                                    .frame(width: 100, height: 100)
                                    .background(.gray)
                                    .opacity(0.6)
                                    .cornerRadius(30.0)
                                VStack {
                                    Text("\(model.payloadWeight.first?.kg ?? 0)")
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                    Text("Нагрузка")
                                        .font(.caption2)
                                        .foregroundStyle(.white)
                                }
                            }
                            .padding(.trailing, 10)
                        }
                    }
                    .padding(.leading, 10)
                    .scrollIndicators(.hidden)
                }
                Group {
                    VStack(spacing: 5) {
                        HStack {
                            Text("Первый запуск")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .frame(width: 120, height: 20, alignment: .leading)
                                .padding(.leading, 5)
                                .padding(.trailing, 90)
                            Text(model.firstFlight)
                                .foregroundStyle(.white)
                                .font(.caption)
                                .frame(width: 150, height: 20, alignment: .trailing)
                                .padding(.trailing, 5)
                        }
                        HStack {
                            Text("Cтрана")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .frame(width: 100, height: 20, alignment: .leading)
                                .padding(.leading, 15)
                            Text(model.country)
                                .foregroundStyle(.white)
                                .font(.caption)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 15)
                        }
                        HStack {
                            Text("Стоимость запуска")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .frame(width: 150, height: 20, alignment: .leading)
                                .padding(.leading, 15)
                            Text("\(model.costPerLaunch.rounded())")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 15)
                        }
                    }
                }
                .padding(.top, 20)
                Group {
                    Text("ПЕРВАЯ СТУПЕНЬ")
                        .foregroundStyle(.white)
                        .font(.title2)
                        .frame(width: 190, height: 50, alignment: .leading)
                        .padding(.trailing, 180)
                    VStack(spacing: 5) {
                        HStack {
                            Text("Количество двигателей")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .frame(width: 200, height: 20, alignment: .leading)
                                .padding(.trailing, 140)
                            Text("\(model.firstStage.engines ?? 0)")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .frame(width: 20, height: 20, alignment: .trailing)
                        }
                        HStack {
                            Text("Количество топлива")
                                .frame(width: 120, height: 20, alignment: .leading)
                                .foregroundStyle(.white)
                                .font(.caption)
                                .padding(.leading, 15)
                            Text("\(model.firstStage.fuelAmountTons.rounded())")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 5)
                        }
                        HStack(spacing: 180) {
                            Text("Время сгорания")
                                .frame(width: 120, height: 20, alignment: .leading)
                                .foregroundStyle(.white)
                                .font(.caption)
                                .padding(.leading, 15)
                            Text("\(model.firstStage.burnTimeSeconds?.rounded() ?? 0)")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 5)
                        }
                    }
                    Group {
                        Text("ВТОРАЯ СТУПЕНЬ")
                            .foregroundStyle(.white)
                            .font(.title2)
                            .frame(width: 190, height: 50, alignment: .leading)
                            .padding(.trailing, 180)
                        VStack(spacing: 5) {
                            HStack {
                                Text("Количество двигателей")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .frame(width: 200, height: 20, alignment: .leading)
                                    .padding(.trailing, 140)
                                Text("\(model.secondStage.engines ?? 0)")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .frame(width: 20, height: 20, alignment: .trailing)
                            }
                            HStack {
                                Text("Количество топлива")
                                    .frame(width: 120, height: 20, alignment: .leading)
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .padding(.leading, 15)
                                Text("\(model.secondStage.fueldAmountTons?.rounded() ?? 0)")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding(.trailing, 5)
                            }
                            HStack {
                                Text("Время сгорания")
                                    .frame(width: 120, height: 20, alignment: .leading)
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .padding(.leading, 15)
                                Text("\(model.secondStage.burnTimeSeconds?.rounded() ?? 0)")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding(.trailing, 5)
                            }

                        }
                    }
                }
                .sheet(isPresented: $isSettingsAtive, content: {
                    SettingsView(heightState: $heightState, diameterState: $diameterState, massState: $massState)
                })
            }
            .background(.black)
            .padding(.top, 30)
        }
    }

}



#Preview {
    var responseModel = ResponseModel(height: ResponseModelParam(meters: 140.0, feet: 142.0), diamter: ResponseModelParam(meters: 122.0, feet: 105.0), firstStage: ResponseModelFirstStage(engines: 2, fuelAmountTons: 140.0, burnTimeSeconds: 10.0), secondStage: ResponseModelSecondStage(engines: 4, fueldAmountTons: 45.0, burnTimeSeconds: 34.0), payloadWeight: [ResponseModelPayloadWeight(id: "12", name: "Paylod", kg: 144.0, lb: 152.0)], flickImages: ["https://"], name: "NameFirst", type: "TypeRocket", costPerLaunch: 160.0, successratePct: 12.0, firstFlight: "12.05.1994", country: "USA", company: "NETFLIX", description: "Descr", mass: ResponseModelMass(kg: 144.0, lb: 152.0), id: "12345786")

    DetailInfoView(model: responseModel, heightState: .feet, diameterState: .feet, massState: .kg)
}
