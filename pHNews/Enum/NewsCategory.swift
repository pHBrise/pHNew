//
//  Category.swift
//  pHNews
//
//  Created by Phanvit Chevamongkolnimit on 4/9/2567 BE.
//

import Foundation

enum NewsCategory: String, CaseIterable, Codable {
    case business = "Business"
    case entertainment = "Entertainment"
    case general = "General"
    case health = "Health"
    case science = "Science"
    case sports = "Sports"
    case technology = "Technology"
}
