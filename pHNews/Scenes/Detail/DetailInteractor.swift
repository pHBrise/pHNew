//
//  DetailInteractor.swift
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

protocol DetailBusinessLogic
{
    func getWebUrl(request: Detail.WebUrl.Request)
}

protocol DetailDataStore
{
    var url: String? { get set }
}

class DetailInteractor: DetailBusinessLogic, DetailDataStore
{
    var presenter: DetailPresentationLogic?
    var worker: DetailWorker?
    var url: String?
    
    // MARK: Do something
    
    func getWebUrl(request: Detail.WebUrl.Request)
    {
        worker = DetailWorker()
        worker?.doSomeWork()
        
        let response = Detail.WebUrl.Response(url: url)
        presenter?.presentWebUrl(response: response)
    }
}
