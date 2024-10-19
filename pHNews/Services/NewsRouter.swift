//
//  NewsRouter.swift
//  pHNews
//
//  Created by Phanvit Chevamongkolnimit on 22/7/2567 BE.
//

import Foundation
import Alamofire

enum NewsRouter {
    
    case everything(_ requestModel: EverythingRequest)
    case topHeadline(_ requestModel: TopHeadlineRequest)
    case sources(_ requestModel: EverythingRequest)
    
    public var baseUrl: URL {
        return URL(string:"https://newsapi.org/v2/")!
    }
    
    public var path: String {
        switch self {
        case .everything:
            return "everything"
        case .topHeadline:
            return "top-headlines"
        case .sources:
            return "top-headlines/sources"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .everything, .topHeadline, .sources:
            return .get
        }
    }
    
    public var param: Parameters? {
        switch self {
        case let .everything(request):
            return request.dictionary
        case let .topHeadline(request):
            return request.dictionary
        case let .sources(request):
            return request.dictionary
        }
    }
    
    var headers: HTTPHeaders {
        var header = Alamofire.HTTPHeaders()
        header.add(.contentType("application/json"))
        header.add(.authorization(bearerToken: "174bd2773a174047bb0fbb5e2a0e2cb3"))
        return header
    }
}

extension NewsRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = baseUrl.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        urlRequest.headers = headers
        switch method {
        case .get:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: param)
        default:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: param)
        }
        return urlRequest
    }
}
