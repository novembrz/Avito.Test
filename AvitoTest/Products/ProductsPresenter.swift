//
//  ProductsPresenter.swift
//  AvitoTest
//
//  Created by Дарья on 21.01.2021.
//

import Foundation

class ProductsPresenter: ProductsPresenterProtocol {
    
    weak var view: ProductsViewController!
    var interactor: ProductsInteractorProtocol!
    
    var dataArray: [List] = []
    
    init(interactor: ProductsInteractorProtocol) {
        self.interactor = interactor
    }
    
    func recieveData(dataViewModel: ProductsViewModel) {
        dataArray = dataViewModel.dataListArray
        let imagesArray = dataViewModel.dataImagesArray
        let title = dataViewModel.title
        let buttonTitle = dataViewModel.buttonTitle
        
        view?.displayData(title: title, buttonTitle: buttonTitle, fetchedData: dataArray, fetchedImages: imagesArray)
    }
}

extension ProductsPresenter: ProductsViewEventHandler {
    func fetchData() {
        interactor.loadDataFromJson()
    }
}
