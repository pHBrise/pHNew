//
//  MainRouter.swift
//  pHNews
//
//  Created by Phanvit Chevamongkolnimit on 18/8/2567 BE.
//  Copyright (c) 2567 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol MainRoutingLogic
{
    func routeToDetail(url: String?)
}

protocol MainDataPassing
{
    var dataStore: MainDataStore? { get }
}

class MainRouter: NSObject, MainRoutingLogic, MainDataPassing
{
    weak var viewController: MainViewController?
    var dataStore: MainDataStore?
    
    // MARK: Routing
    
    
    public func createModule() -> MainViewController {
        let viewController = MainViewController(nibName: "MainViewController", bundle: nil)
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        viewController.interactor = interactor
        viewController.router = self
        interactor.presenter = presenter
        presenter.viewController = viewController
        self.viewController = viewController
        self.dataStore = interactor
        return viewController
    }
    
    func routeToDetail(url: String?) {
        let view = DetailRouter().createModule()
        view.modalPresentationStyle = .popover
        var destinationDS = view.router?.dataStore
        destinationDS?.url = url
        viewController?.present(view, animated: true, completion: nil)
    }
    
}