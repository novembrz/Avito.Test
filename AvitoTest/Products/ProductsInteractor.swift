//
//  ProductsInteractor.swift
//  AvitoTest
//
//  Created by Дарья on 21.01.2021.
//

import UIKit

class ProductsInteractor: ProductsInteractorProtocol {
    
    weak var presenter: ProductsPresenterProtocol!
    var networkService: NetworkServiceProtocol
    
    var productsData: ProductsModel?
    var dataImages: [UIImage]?
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func loadDataFromJson() {
        networkService.fetchData { [weak self] resultData in
            guard let self = self else { return }
            
            DispatchQueue.main.async { // присваеваем полученную дату в переменные
                self.productsData = resultData
                self.dataImages = [UIImage]()
                
                for imageURL in resultData.result.list {
                    guard let url = URL(string: imageURL.icon.url),
                          let image = UIImage(data: try! Data(contentsOf: url)) else { return }
                    self.dataImages?.append(image)
                }
                
                guard let data = self.productsData, let images = self.dataImages else { return }
                
                //print(data)
                
                self.presenter.recieveData(dataViewModel: ProductsViewModel(title: resultData.result.title, buttonTitle: resultData.result.selectedActionTitle, dataListArray: data.result.list, dataImagesArray: images))
            }
        }
    }
}
