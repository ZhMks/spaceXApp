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

    private let networkService: INetworkService
    private let decoderService: IDecoderService

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
            ResponseModel(height:  ResponseModelParam(meters: model.height.meters, feet: model.height.feet),
                          diamter:  ResponseModelParam(meters: model.diamter.meters, feet: model.diamter.feet),
                          engines: ResponseModelEngines(isp: ResponseModelIsp(seaLevel: model.engines.isp.seaLevel, vacuum: model.engines.isp.vacuum),
                                                        thrustSeaLevel: ResponseModelThrust(kN: model.engines.thrustSeaLevel.kN, lbf: model.engines.thrustSeaLevel.lbf),
                                                        thrustVacuum: ResponseModelThrust(kN: model.engines.thrustVacuum.kN, lbf: model.engines.thrustVacuum.lbf),
                                                        number: model.engines.number,
                                                        tupe: model.engines.tupe,
                                                        version: model.engines.version,
                                                        layout: model.engines.layout,
                                                        engineLossMax: model.engines.engineLossMax,
                                                        propellant: model.engines.propellant,
                                                        secondPropellant: model.engines.secondPropellant,
                                                        thrustToWeight: model.engines.thrustToWeight),
                          firstStage: ResponseModelFirstStage(thrustSeaLevel: ResponseModelThrust(kN: model.firstStage.thrustSeaLevel.kN, lbf: model.firstStage.thrustSeaLevel.lbf),
                                                              thrustVacuum: ResponseModelThrust(kN: model.firstStage.thrustVacuum.kN, lbf: model.firstStage.thrustVacuum.lbf),
                                                              reusable: model.firstStage.reusable,
                                                              engines: model.firstStage.engines,
                                                              fuelAmountTons: model.firstStage.fuelAmountTons,
                                                              burnTimeSeconds: model.firstStage.burnTimeSeconds),
                          secondStage: ResponseModelSecondStage(thrust: ResponseModelThrust(kN: model.secondStage.thrust.kN, lbf: model.secondStage.thrust.lbf),
                                                                payloads: ResponseModelPayloads(compositeFairing: ResponseModelFairing(height: ResponseModelParam(meters: model.secondStage.payloads.compositeFairing.height.meters,
                                                                                                                                                                  feet: model.secondStage.payloads.compositeFairing.height.feet),
                                                                                                                                       diameter: ResponseModelParam(meters: model.secondStage.payloads.compositeFairing.diameter.meters,
                                                                                                                                                                    feet: model.secondStage.payloads.compositeFairing.diameter.feet)),
                                                                                                option: model.secondStage.payloads.option),
                                                                reusable: model.secondStage.reusable,
                                                                engines: model.secondStage.engines,
                                                                fueldAmountTons: model.secondStage.fueldAmountTons,
                                                                burnTimeSeconds: model.secondStage.burnTimeSeconds),
                          landingLegs: ResponseModelLegs(number: model.landingLegs.number, material: model.landingLegs.material),
                          payloadWeight: model.payloadWeight.map({ payloadModel in
                ResponseModelPayloadWeight(id: payloadModel.id, name: payloadModel.name, kg: payloadModel.kg, lb: payloadModel.lb)
            }),
                          flickImages: model.flickImages,
                          name: model.name,
                          type: model.type,
                          active: model.active,
                          stages: model.stages,
                          boosters: model.boosters,
                          costPerLaunch: model.costPerLaunch,
                          successratePct: model.successratePct,
                          firstFlight: model.firstFlight,
                          country: model.country,
                          company: model.company,
                          description: model.description,
                          wikipedia: model.wikipedia)
        })
        return responseArray
    }
}
