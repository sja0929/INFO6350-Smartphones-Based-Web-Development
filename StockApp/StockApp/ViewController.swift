//
//  ViewController.swift
//  StockUpdate
//
//  Created by Jiaan Shi on 04/11/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {

    
    let apiKey = "a20e698b4b12f0266c0625b4dec3aeb6"
    
    let apiURL = "https://financialmodelingprep.com/api/v3/profile/"
    
    @IBOutlet weak var txtStockName: UITextField!
    
    @IBOutlet weak var CEOname: UILabel!
    
    @IBOutlet weak var lblStockValue: UILabel!
   
   override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func getStockValue(_ sender: Any) {
        if self.txtStockName.text == nil {return}
        guard let stockName = txtStockName.text else { return }
        let url = "\(apiURL)\(stockName)?apikey=\(apiKey)"
        
        getStockValue(stockURL: url, stockName: stockName)
    }
    
    func getStockValue(stockURL: String!, stockName: String!) {
        SwiftSpinner.show("Get Stock value for \(stockName)")
        Alamofire.request(stockURL).responseJSON { (response) in
            SwiftSpinner.hide()
            if response.result.isSuccess{
                guard let jsonString = response.result.value else { return }
                guard let stockJSON: [JSON] = JSON(jsonString).array else { return }
                
                if stockJSON.count < 1 {return}
                guard let price = stockJSON[0]["price"].double else { return }
                guard let ceoName = stockJSON[0]["ceo"].rawString() else { return }
 
                self.lblCEOName.text = "\(ceoName)"
                self.lblStockPrice.text = "\(price)"
            }
        }
    }
    

}

