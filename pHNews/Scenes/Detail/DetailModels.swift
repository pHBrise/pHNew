//
//  DetailModels.swift
//  pHNews
//
//  Created by Phanvit Chevamongkolnimit on 5/9/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Detail
{
  // MARK: Use cases
  
  enum WebUrl
  {
    struct Request
    {
    }
    struct Response
    {
        var url: String?
    }
    struct ViewModel
    {
        var url: URL?
    }
  }
}