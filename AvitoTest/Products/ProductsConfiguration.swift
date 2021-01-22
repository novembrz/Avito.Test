//
//  ProductsConfiguration.swift
//  AvitoTest
//
//  Created by Дарья on 21.01.2021.
//

import UIKit

class ProductsConfigurator: ProductsConfiguratorProtocol {
    
    static func createMainVC() -> UIViewController {
        
        let view = ProductsViewController()
        let networkService = NetworkService()
        let interactor = ProductsInteractor(networkService: networkService)
        let presenter = ProductsPresenter(interactor: interactor)

        view.eventHandler = presenter
        presenter.interactor = interactor
        presenter.view = view
        interactor.networkService = networkService
        interactor.presenter = presenter
        
        return view
    }
}
