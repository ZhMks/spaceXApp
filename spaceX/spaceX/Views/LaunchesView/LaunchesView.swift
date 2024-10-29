//
//  LaunchesView.swift
//  spaceX
//
//  Created by Максим Жуин on 17.10.2024.
//
import SwiftUI


struct LaunchesView: View {
    var model: ResponseModel
    var dataSource: DataSourceService
    @State private var launchesModel: [LaunchesFlightModel?]?
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView(.vertical) {
            if let launchesModel = launchesModel {
                if launchesModel.isEmpty {
                    Text("NO DATA")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(width: 500)
                }
                ForEach(0..<launchesModel.count, id: \.self) { index in
                    let model = launchesModel[index]
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 40, height: 40))
                            .foregroundStyle(.gray)
                        VStack(spacing: 15) {
                            Text("\(model!.name)")
                                .foregroundStyle(.white)
                                .font(.caption)
                                .fontWeight(.semibold)
                            Text(convertDateToNormalFormat(string: model?.date ?? ""))
                                .foregroundStyle(.white)
                                .font(.caption)
                        }
                    }
                }
            } 
        }
        .background(content: {
            Color.black.ignoresSafeArea()
        })
        .navigationBarBackButtonHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.white)
                    Text("Назад")
                        .foregroundStyle(.white)
                    Text("\(model.name)")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.leading, 90)
                }
            })
        .onAppear {
            dataSource.fetchLaunchesData(for: model.id, urlString: .launchestUrl) { result in
                switch result {
                case .success(let success):
                    launchesModel = success.filter({ $0.id == model.id })
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }

    private func convertDateToNormalFormat(string: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let date = dateFormatter.date(from: string) else { return "Invalid date" }
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: date)
    }

}

struct LaunchesView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a mock ResponseModel
        let mockModel = ResponseModel(height: ResponseModelParam(meters: 140.0, feet: 142.0), diamter: ResponseModelParam(meters: 122.0, feet: 105.0), firstStage: ResponseModelFirstStage(engines: 2, fuelAmountTons: 140.0, burnTimeSeconds: 10.0), secondStage: ResponseModelSecondStage(engines: 4, fueldAmountTons: 45.0, burnTimeSeconds: 34.0), payloadWeight: [ResponseModelPayloadWeight(id: "12", name: "Paylod", kg: 144.0, lb: 152.0)], flickImages: ["https://"], name: "NameFirst", type: "TypeRocket", costPerLaunch: 160.0, successratePct: 12.0, firstFlight: "12.05.1994", country: "USA", company: "NETFLIX", description: "Descr", mass: ResponseModelMass(kg: 144.0, lb: 152.0), id: "12345786")
        let mockNetwork = NetworkService()
        let decoderService = DecoderService()
        let mockDataSource = DataSourceService(networkService: mockNetwork, decoderService: decoderService)

        // Return the LaunchesView with the mock model
        LaunchesView(model: mockModel, dataSource: mockDataSource)
            .preferredColorScheme(.dark) // Optional: Set the color scheme for the preview
    }
}




//Color.black
//    .edgesIgnoringSafeArea(.all)
//    .navigationBarBackButtonHidden(true)
//    .navigationBarTitleDisplayMode(.inline)
//    .navigationBarItems(leading: Button(action: {
//        presentationMode.wrappedValue.dismiss()
//    }) {
//        HStack {
//            Image(systemName: "chevron.left")
//                .foregroundStyle(.white)
//            Text("Назад")
//                .foregroundStyle(.white)
//            Text("\(model.name)")
//                .font(.title2)
//                .fontWeight(.semibold)
//                .foregroundStyle(.white)
//                .padding(.leading, 90)
//        }
//        .onAppear {
//            dataSource.fetchLaunchesData(for: model.id, urlString: .launchestUrl) { result in
//                switch result {
//                case .success(let success):
//                    launchesModel = success.filter({ $0.id == model.id })
//                case .failure(let failure):
//                    print(failure.localizedDescription)
//                }
//            }
//        }
//
//    })
