//
//  NetworkService.swift
//  AvitoTest
//
//  Created by Дарья on 21.01.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData(completion: @escaping (ProductsModel) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func fetchData(completion: @escaping (ProductsModel) -> Void) {
        
        let urlString = "https://raw.githubusercontent.com/avito-tech/internship/main/result.json"
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error!.localizedDescription)
                return
            }
            print(data)
            
            do{
                let decoder = JSONDecoder()
                let json = try decoder.decode(ProductsModel.self, from: data)
                completion(json)
                
            }catch let error as NSError{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
