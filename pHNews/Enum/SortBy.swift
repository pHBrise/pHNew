//
//  SortBy.swift
//  pHNews
//
//  Created by Phanvit Chevamongkolnimit on 2/8/2567 BE.
//

import Foundation


enum SortBy: String, Codable {
    case relevancy = "relevancy"
    case popularity = "popularity"
    case publishedAt = "publishedAt"
}
