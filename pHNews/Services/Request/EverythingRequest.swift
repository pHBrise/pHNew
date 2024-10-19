//
//  EverythingRequest.swift
//  pHNews
//
//  Created by Phanvit Chevamongkolnimit on 23/7/2567 BE.
//

import Foundation

struct EverythingRequest: Codable {
    public var q: String
    public var searchIn: String?
    public var sortBy: String?
    public var pageSize: String?
    public var page: String?
}
