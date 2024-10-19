//
//  NewsAPI.swift
//  pHNews
//
//  Created by Phanvit Chevamongkolnimit on 4/8/2567 BE.
//

import Foundation
import Alamofire

protocol NewsAPIProtocol {
    func requestAPI<T>(_ router: NewsRouter) async throws -> T? where T : Decodable, T : Encodable
    func requestAPI<T>(_ router: NewsRouter, completionHandler: @escaping (T?) -> Void, errorHandler: @escaping (Error) -> Void) where T : Decodable, T : Encodable
}

public class NewsAPI:NewsAPIProtocol {
    func requestAPI<T>(_ router: NewsRouter, completionHandler: @escaping (T?) -> Void, errorHandler: @escaping (any Error) -> Void) where T : Decodable, T : Encodable {
        do {
            let urlRequest = try router.asURLRequest()
            AF.request(urlRequest).validate().responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    completionHandler(data)
                case .failure(let error):
                    errorHandler(error)
                }
            }
        } catch {
            errorHandler(AFError.createURLRequestFailed(error: error))
        }
    }
    
    func requestAPI<T>(_ router: NewsRouter) async throws -> T? where T : Decodable, T : Encodable {
        return try await withCheckedThrowingContinuation { continuation in
            do {
                let   urlRequest = try router.asURLRequest()
                AF.request(urlRequest).validate().responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let data):
                        continuation.resume(returning: data)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
            } catch {
                continuation.resume(throwing: AFError.createURLRequestFailed(error: error))
            }
        }
    }
}

