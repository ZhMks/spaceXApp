//
//  DetailInfoView.swift
//  spaceX
//
//  Created by Максим Жуин on 10.10.2024.
//
import SwiftUI

private enum ChangeState {
    case firstLaunch
    case stage
}

struct DetailInfoView: View {

    // MARK: - Properties
    var model: ResponseModel

    @Binding var heightState: HeightModelState
    @Binding var massState: MassModelState
    @Binding var diameterState: DiameterModelState
    @Binding var isSettingsActive: Bool
    @Binding var isLaunchesActive: Bool
    

    // MARK: - View
    var body: some View {
        let firstLaunch = convertDateToNormalFormat(string: model.firstFlight)
        let price = removeZeros(double: model.costPerLaunch, for: .firstLaunch)
        let firstStageNumberOfFuel = removeZeros(double: model.firstStage.fuelAmountTons,for: .stage)
        let firstStageBurningTime = removeZeros(double: model.firstStage.burnTimeSeconds ?? 0,for: .stage)
        let secondStageNumberOfFuel = removeZeros(double: model.secondStage.fueldAmountTons ?? 0, for: .stage)
        let secondStageBurningTime = removeZeros(double: model.secondStage.burnTimeSeconds ?? 0,for: .stage)
        
        @State  var rocketHeight = model.height.feet ?? 0
        @State var rocketMass = model.mass.lb ?? 0
        @State var rocketDiameter = model.diamter.feet ?? 0
        
        ScrollView {
            VStack {
                HStack(spacing: 50) {
                    Text(model.name)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .tracking(2.0)
                        .font(.title2)
                        .padding(.leading, 10)
                        .padding()
                    Button {
                        isLaunchesActive.toggle()
                    } label: {
                        ZStack {
                            Image("rocket")
                                .resizable()
                                .frame(width: 35, height: 35)
                            Color.white.blendMode(.sourceAtop)
                        }
                        .drawingGroup(opaque: false)
                    }
                    .frame(width: 40, height: 40)
                    Button {
                        isSettingsActive.toggle()
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
                                    Text("\(rocketHeight)")
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                    Text("Высота, \(heightState.description)")
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
                                    Text("\(rocketDiameter)")
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                    Text("Диаметр, \(diameterState.description)")
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
                                    Text("\(rocketMass)")
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                    Text("Масса, \(massState.description)")
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
                            Text(firstLaunch)
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
                            Text(price)
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
                            Text(firstStageNumberOfFuel)
                                .foregroundStyle(.white)
                                .font(.caption)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 5)
                        }
                        HStack() {
                            Text("Время сгорания")
                                .frame(width: 120, height: 20, alignment: .leading)
                                .foregroundStyle(.white)
                                .font(.caption)
                                .padding(.leading, 15)
                            Text(firstStageBurningTime)
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
                                Text(secondStageNumberOfFuel)
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
                                Text(secondStageBurningTime)
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .padding(.trailing, 5)
                            }
                            
                        }
                    }
                }
            }
            .onChange(of: heightState) { oldValue, newValue in
                let newHeight = convertHeight(state: newValue, value: rocketHeight).rounded(.towardZero)
                print(newHeight)
                rocketHeight = newHeight
                print(rocketHeight)
            }
            .onChange(of: massState, { oldValue, newValue in
//                let newMass = convertMass(state: newValue, value: rocketMass).rounded(.towardZero)
//                print(newMass)
//                rocketMass = newMass
//                print(rocketMass)
            })
            .onChange(of: diameterState, { oldValue, newValue in
//                let newDiameter = convertDiameter(state: newValue, value: rocketDiameter).rounded(.towardZero)
//                print(newDiameter)
//                rocketDiameter = newDiameter
//                print(rocketDiameter)
            })
            .background(.black)
            .padding(.top, 30)
        }
    }
    
    // MARK: - Functions
    private func convertHeight(state: HeightModelState, value: Double) -> Double {
        switch state {
        case .ft:
            return value * 3.28084
        case .m:
            return value / 3.28084
        }
    }
    
    private func convertMass(sate: MassModelState, value: Double) -> Double {
        switch sate {
        case .kg:
            return value * 0.453592
        case .lb:
            return value / 0.453592
        }
    }
    
    private func convertDiameter(state: DiameterModelState, value: Double) -> Double {
        switch state {
        case .ft:
            return value * 3.28084
        case .m:
            return value / 3.28084
        }
    }
    
    private func convertDateToNormalFormat(string: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let date = dateFormatter.date(from: string) else { return "Invalid date" }
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: date)
    }
    
    private func removeZeros(double: Double, for state: ChangeState ) -> String {
        switch state {
        case .firstLaunch:
            let number = String(double).components(separatedBy: "0").first!
            let convertedString = "$\(number) млн"
            return convertedString
        case .stage:
            let number = String(double).components(separatedBy: ".0").first!
            let convertedString = "\(number) tons"
            return convertedString
        }
    }
}



#Preview {
    var responseModel = ResponseModel(height: ResponseModelParam(meters: 140.0, feet: 142.0), diamter: ResponseModelParam(meters: 122.0, feet: 105.0), firstStage: ResponseModelFirstStage(engines: 2, fuelAmountTons: 140.0, burnTimeSeconds: 10.0), secondStage: ResponseModelSecondStage(engines: 4, fueldAmountTons: 45.0, burnTimeSeconds: 34.0), payloadWeight: [ResponseModelPayloadWeight(id: "12", name: "Paylod", kg: 144.0, lb: 152.0)], flickImages: ["https://"], name: "NameFirst", type: "TypeRocket", costPerLaunch: 160.0, successratePct: 12.0, firstFlight: "12.05.1994", country: "USA", company: "NETFLIX", description: "Descr", mass: ResponseModelMass(kg: 144.0, lb: 152.0), id: "12345786")
    @State var heightState: HeightModelState = .m
    @State var massState: MassModelState = .kg
    @State var diameterState: DiameterModelState = .m
    @State var isSettingsActive = false
    @State var isLaunchesActive = false

    DetailInfoView(model: responseModel, heightState: $heightState, massState: $massState, diameterState: $diameterState, isSettingsActive: $isSettingsActive, isLaunchesActive: $isLaunchesActive)
}
