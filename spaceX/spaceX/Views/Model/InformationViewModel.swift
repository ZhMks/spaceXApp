//
//  InfotmationViewModel.swift
//  spaceX
//
//  Created by Максим Жуин on 04.10.2024.
//

import SwiftUI


enum ViewModelState {
    case feet
    case meters
    case kg
    case lbs
}

final class InformationViewModel: ObservableObject {

    @Published var tabIndex = 0

    @Published var state: ViewModelState

    @Published var onboardingModel: [ResponseModel] = []


    init(state: ViewModelState) {
        self.state = state
    }

    func recieveOn(model: [ResponseModel]) {
        DispatchQueue.main.async {
            self.onboardingModel = model
        }
    }

    func fetchData() {
        let url = "https://api.spacexdata.com/v4/rockets"
        let networkService = NetworkService.shared
        let decoderService = DecoderService()
        let dataSource = DataSourceService(networkService: networkService, decoderService: decoderService)
        dataSource.fetchData(urlString: url) { [weak self] result in
            switch result {
            case .success(let responseModel):
                print(responseModel.count)
                self?.recieveOn(model: responseModel)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }

    }
}
