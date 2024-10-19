//
//  TopHeadline.swift
//  pHNews
//
//  Created by Phanvit Chevamongkolnimit on 4/9/2567 BE.
//

import Foundation


struct TopHeadlineRequest: Codable  {
    public var q: String?
    public var country: String
    public var category: String?
    public var sources: String?
    public var pageSize: String?
    public var page: String?
}
