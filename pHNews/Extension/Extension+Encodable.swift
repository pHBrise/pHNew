//
//  JSONCodable.swift
//  pHNews
//
//  Created by Phanvit Chevamongkolnimit on 3/8/2567 BE.
//

import Foundation

extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
