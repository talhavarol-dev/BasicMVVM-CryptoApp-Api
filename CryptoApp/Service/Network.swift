//
//  Network.swift
//  CryptoApp
//
//  Created by Talha Varol on 25.03.2022.
//

import Foundation

class Network{
        
    func downloadCurrency(url: URL, completion: @escaping ([Crypto]?) -> Void){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                
              let cryptoList = try? JSONDecoder().decode([Crypto].self, from: data)
                completion(cryptoList)
                print(cryptoList)
            }
        }.resume()
    }
    
    
}
