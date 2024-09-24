//
//  DecoderService.swift
//  spaceX
//
//  Created by Максим Жуин on 24.09.2024.
//

import SwiftUI

protocol IDecoderService: AnyObject {
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> [T]
}

final class DecoderService: IDecoderService {

    func decode<T>(_ type: T.Type, from data: Data) throws -> [T] where T : Decodable {
        let decoder = JSONDecoder()
        do {
            let newModel = try decoder.decode([T].self, from: data)
            return newModel
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print(error.localizedDescription)
        }
        return []
    }

}

