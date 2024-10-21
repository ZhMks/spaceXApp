//
//  DataSourceService.swift
//  spaceX
//
//  Created by Максим Жуин on 24.09.2024.
//

import SwiftUI


protocol IDataSourceService: AnyObject {
    init(networkService: INetworkService, decoderService: IDecoderService)
    func fetchRocketsData(urlString: String, completion: @escaping(Result<[ResponseModel], Error>) -> Void)
    func fetchLaunchesData(for id: String, urlString: String, completion: @escaping(Result<[LaunchesFlightModel], Error>) -> Void)
}

final class DataSourceService: IDataSourceService {

     let networkService: INetworkService
     let decoderService: IDecoderService

    init(networkService: any INetworkService, decoderService: any IDecoderService) {
        self.networkService = networkService
        self.decoderService = decoderService
    }


    func fetchRocketsData(urlString: String, completion: @escaping (Result<[ResponseModel], any Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        networkService.fetchData(url: url) { [weak self] result in
            switch result {
            case .success(let success):
                do {
                    if let fetchedModel = try self?.decoderService.decode(NetworkModel.self, from: success) {
                        if let resposneModel = self?.convertData(networkModel: fetchedModel) {
                            completion(.success(resposneModel))
                        }
                    }
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
                          mass: ResponseModelMass(kg: model.mass.kg, lb: model.mass.lb), id: model.id)
        })
        return responseArray
    }

    func fetchLaunchesData(for id: String, urlString: String, completion: @escaping (Result<[LaunchesFlightModel], any Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        networkService.fetchData(url: url) { [weak self] result in
            switch result {
            case .success(let success):
                do {
                    if let fetchedModel = try self?.decoderService.decode(LaunchesNetworkModel.self, from: success) {
                        guard let responseModel = self?.convertLaunchesData(for: id, model: fetchedModel) else {
                            completion(.success([]))
                            return
                        }
                        completion(.success(responseModel))
                    }
                } catch {
                    completion(.failure(error))
                }
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }

    private func convertLaunchesData(for id: String, model: [LaunchesNetworkModel]) -> [LaunchesFlightModel] {
        var responseArray: [LaunchesFlightModel] = []
        responseArray = model.map({ networkModel in
            LaunchesFlightModel(name: networkModel.name, date: networkModel.date, success: networkModel.success, id: networkModel.rocketID)
        })
        return responseArray
    }
}
