//
//  ProductsProtocols.swift
//  AvitoTest
//
//  Created by Дарья on 21.01.2021.
//

import UIKit

protocol ProductsViewProtocol: class {
    func displayData(title: String, buttonTitle: String, fetchedData: [List], fetchedImages: [UIImage]) //конфигур вью ИЗМЕНИ ЭТО ЧЕРЕЗ ПРЕЗЕНТЕР
}

protocol ProductsViewEventHandler {
    func fetchData() //обновляем и передаем дату во вью
}

protocol ProductsPresenterProtocol: class {
    var dataArray: [List] {get set}
    func recieveData(dataViewModel: ProductsViewModel) // вытаскивает значения из итнерактора и отдает вью
}

protocol ProductsInteractorProtocol: class {
    var productsData: ProductsModel? {get set} //кладем дату
    var dataImages: [UIImage]? {get set} //кладем картинки
    func loadDataFromJson() // Переадем данные в presenter.recieveData
}

protocol ProductsConfiguratorProtocol: class {
    static func createMainVC() -> UIViewController // конфигурируем вью, отправляем в сценДел
}

