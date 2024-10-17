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
    @State private var isLauncesActive = false

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
                        HStack {
                            ZStack {
                                Rectangle()
                                    .frame(width: 80, height: 80)
                                    .background(.gray)
                                    .opacity(0.6)
                                    .cornerRadius(15.0)
                                VStack {
                                    Text("\(model.height.meters)")
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
                                    .frame(width: 80, height: 80)
                                    .background(.gray)
                                    .opacity(0.6)
                                    .cornerRadius(15.0)
                                VStack {
                                    Text("\(model.diamter.meters)")
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
                                    .frame(width: 80, height: 80)
                                    .background(.gray)
                                    .opacity(0.6)
                                    .cornerRadius(15.0)
                                VStack {
                                    Text("\(model.mass.kg)")
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
                                    .frame(width: 80, height: 80)
                                    .background(.gray)
                                    .opacity(0.6)
                                    .cornerRadius(15.0)
                                VStack {
                                    Text("\(model.payloadWeight.first?.kg)")
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                    Text("Полезная нагрузка")
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
                    VStack {
                        HStack {
                            Text("Первый запуск")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .padding(.leading, 10)
                            Text(model.firstFlight)
                                .foregroundStyle(.white)
                                .font(.caption)
                        }
                        HStack {
                            Text("Cтрана")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .padding(.leading, 10)
                                .padding(.top, 5)
                            Text(model.country)
                                .foregroundStyle(.white)
                                .font(.caption)
                                .multilineTextAlignment(.leading)
                        }
                        HStack {
                            Text("Стоимость запуска")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .padding(.leading, 10)
                                .padding(.top, 5)
                            Text("\(model.costPerLaunch.rounded())")
                                .foregroundStyle(.white)
                                .font(.caption)
                        }
                    }
                }
                .padding(.top, 20)
                Group {
                    Text("ПЕРВАЯ СТУПЕНЬ")
                        .foregroundStyle(.white)
                        .font(.title2)
                        .padding(.trailing, 155)
                        .padding(.top, 25)
                        .multilineTextAlignment(.leading)
                    VStack {
                        HStack {
                            Text("Количество двигателей")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .padding(.trailing, 130)
                                .padding(.top, 5)
                            Text("\(model.firstStage.engines)")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .multilineTextAlignment(.leading)
                        }
                        HStack {
                            Text("Количество топлива")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .padding(.trailing, 145)
                                .padding(.top, 5)
                            Text("\(model.firstStage.fuelAmountTons.rounded())")
                                .foregroundStyle(.white)
                                .font(.caption)
                        }
                        HStack {
                            Text("Время сгорания")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .padding(.trailing, 155)
                                .padding(.top, 5)
                            Text("\(model.firstStage.burnTimeSeconds?.rounded())")
                                .foregroundStyle(.white)
                                .font(.caption)
                        }
                    }
                    Group {
                        Text("ВТОРАЯ СТУПЕНЬ")
                            .foregroundStyle(.white)
                            .font(.title2)
                            .multilineTextAlignment(.leading)
                            .padding(.trailing, 155)
                            .padding(.top, 25)
                        VStack {
                            HStack {
                                Text("Количество двигателей")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .padding(.trailing, 130)
                                    .padding(.top, 5)
                                Text("\(model.secondStage.engines)")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                            }
                            HStack {
                                Text("Количество топлива")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .padding(.trailing, 133)
                                    .padding(.top, 5)
                                Text("\(model.secondStage.fueldAmountTons?.rounded())")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                            }
                            HStack {
                                Text("Время сгорания")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .padding(.trailing, 155)
                                    .padding(.top, 5)
                                Text("\(model.secondStage.burnTimeSeconds?.rounded())")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                            }

                        }
                    }
                    NavigationLink(destination: LaunchesView(model: model), isActive: $isLauncesActive) {
                        EmptyView()
                    }
                }
                .onTapGesture {
                    isLauncesActive = true
                }
                .sheet(isPresented: $isSettingsAtive, content: {
                    SettingsView(heightState: $heightState, diameterState: $diameterState, massState: $massState)
                })
            }
            .background(.black)
            .padding(.top, 30)
        }
        .onTapGesture {
            isLauncesActive.toggle()
        }
    }

}



#Preview {
    var responseModel = ResponseModel(height: ResponseModelParam(meters: 140.0, feet: 142.0), diamter: ResponseModelParam(meters: 122.0, feet: 105.0), firstStage: ResponseModelFirstStage(engines: 2, fuelAmountTons: 140.0, burnTimeSeconds: 10.0), secondStage: ResponseModelSecondStage(engines: 4, fueldAmountTons: 45.0, burnTimeSeconds: 34.0), payloadWeight: [ResponseModelPayloadWeight(id: "12", name: "Paylod", kg: 144.0, lb: 152.0)], flickImages: ["https://"], name: "NameFirst", type: "TypeRocket", costPerLaunch: 160.0, successratePct: 12.0, firstFlight: "12.05.1994", country: "USA", company: "NETFLIX", description: "Descr", mass: ResponseModelMass(kg: 144.0, lb: 152.0), id: "12345786")

    DetailInfoView(model: responseModel, heightState: .feet, diameterState: .feet, massState: .kg)
}
