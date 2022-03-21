//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ensar Batuhan Ünverdi on 21.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cadLabel:UILabel!
    @IBOutlet var chfLabel:UILabel!
    @IBOutlet var gbpLabel:UILabel!
    @IBOutlet var jpyLabel:UILabel!
    @IBOutlet var usdLabel:UILabel!
    @IBOutlet var tryLabel:UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
    }
    
    
    @IBAction func getRatesButton(_ sender:UIButton) {
        
        // 1-) Request && Session = Adrese gidip istekte bulunmak.
        // 2-) Response && Data = Veriyi almak
        // 3-) Parsing && JSON Serialization = Veriyi işlemek, parse etmek

        let url = URL(string: "http://data.fixer.io/api/latest?access_key=eb2a934a7effed630c7391a360ed2756")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else{
                
                if data != nil {
                    
                    do {
                        let result = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String : Any]
                        
                        DispatchQueue.main.async {
                            if let rates = result["rates"] as? [String : Any] {
                                
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD = \(String(cad))"
                                }
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF = \(String(chf))"
                                }
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP = \(String(gbp))"
                                }
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY = \(String(jpy))"
                                }
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD = \(String(usd))"
                                }
                                if let tl = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY = \(String(tl))"
                                }
                            }
                        }
                        
                    }catch {
                        print("Errors")
                    }
                }
            }
        }
        task.resume()
    }
}
