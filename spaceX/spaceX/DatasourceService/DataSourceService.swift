//
//  DataSourceService.swift
//  spaceX
//
//  Created by Максим Жуин on 24.09.2024.
//

import SwiftUI


protocol IDataSourceService: AnyObject {
    init(networkService: INetworkService, decoderService: IDecoderService)
    func fetchData(urlString: String, completion: @escaping(Result<[ResponseModel], Error>) -> Void)
}

final class DataSourceService: IDataSourceService {

     let networkService: INetworkService
     let decoderService: IDecoderService

    init(networkService: any INetworkService, decoderService: any IDecoderService) {
        self.networkService = networkService
        self.decoderService = decoderService
    }


    func fetchData(urlString: String, completion: @escaping (Result<[ResponseModel], any Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        networkService.fetchData(url: url) { result in
            switch result {
            case .success(let success):
                do {
                    let responseModel = try self.decoderService.decode(NetworkModel.self, from: success)
                    completion(.success(self.convertData(networkModel: responseModel)))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }



    private func convertData(networkModel: [NetworkModel]) -> [ResponseModel] {
        var responseArray: [ResponseModel] = []

        responseArray = networkModel.map({ model in
            ResponseModel(height: ResponseModelParam(meters: model.height.meters, feet: model.height.feet),
                          diamter: ResponseModelParam(meters: model.diamter.meters, feet: model.diamter.feet),
                          firstStage: ResponseModelFirstStage(engines: model.firstStage.engines, fuelAmountTons: model.firstStage.fuelAmountTons, burnTimeSeconds: model.firstStage.burnTimeSeconds),
                          secondStage: ResponseModelSecondStage(engines: model.secondStage.engines, fueldAmountTons: model.secondStage.fueldAmountTons, burnTimeSeconds: model.secondStage.burnTimeSeconds),
                          payloadWeight: model.payloadWeight.map({ payload in
                ResponseModelPayloadWeight(id: payload.id, name: payload.name, kg: payload.kg, lb: payload.lb)
            }),
                          flickImages: model.flickImages,
                          name: model.name,
                          type: model.type,
                          costPerLaunch: model.costPerLaunch,
                          successratePct: model.successratePct,
                          firstFlight: model.firstFlight,
                          country: model.country,
                          company: model.company,
                          description: model.description,
                          mass: ResponseModelMass(kg: model.mass.kg, lb: model.mass.lb), id: "main")
        })
        return responseArray
    }
}
