//
//  ViewController.swift
//  CryptoApp
//
//  Created by Talha Varol on 25.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    

    @IBOutlet weak var tableView: UITableView!
   
    private var cryptoListViewModel: CryptoListViewModel!
    var colorArray = [UIColor]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.colorArray = [
        
            UIColor(displayP3Red: 75/255, green: 70/255, blue: 120/255, alpha: 1.0),
            UIColor(displayP3Red: 45/255, green: 80/255, blue: 110/255, alpha: 1.0),
            UIColor(displayP3Red: 25/255, green: 30/255, blue: 80/255, alpha: 1.0),
            UIColor(displayP3Red: 15/255, green: 20/255, blue: 30/255, alpha: 1.0),
            UIColor(displayP3Red: 65/255, green: 10/255, blue: 60/255, alpha: 1.0),
        
        
        ]
       getData()
      
        
        
    }
    func getData(){
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        Network().downloadCurrency(url: url) { (cryptoo) in
            if let cryptoo = cryptoo{
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptoo)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CryptoTableViewCell
        let crytoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.priceLabel.text = crytoViewModel.price
        cell.cryptoNameLabel.text = crytoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 5]
        return cell
    }
}

