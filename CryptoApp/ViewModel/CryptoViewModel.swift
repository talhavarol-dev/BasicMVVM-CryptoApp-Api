//
//  CryptoViewModel.swift
//  CryptoApp
//
//  Created by Talha Varol on 25.03.2022.
//

import Foundation

struct CryptoListViewModel {
    let cryptoCurrencyList: [Crypto]
    
    func numberOfRowsInSection() -> Int{
        return cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel{
        let crypto = cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}




struct CryptoViewModel {
    let cryptoCurrency: Crypto
    
    var name: String {
        return cryptoCurrency.currency
    }
    var price: String{
        return cryptoCurrency.price
    }
}
