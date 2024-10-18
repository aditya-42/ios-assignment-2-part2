//
//  RestockViewController.swift
//  CashRegisterApp
//
//  Created by Aditya Purohit on 17/10/24.
//

import UIKit

class RestockViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var restockTextField: UITextField!
    
    @IBOutlet weak var restockTable: UITableView!
    
    var didSelectProduct = false
    var productIndex = -1;
    
    func throwAlert(alertMessage: String){
        
        let alert = UIAlertController(title: "\(alertMessage)", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
        
    }
    
    @IBAction func restockButtonClicked(_ sender: Any) {
        if let restockQuantity = restockTextField.text {
            if restockQuantity.isEmpty {
                throwAlert(alertMessage: "Empty Quantity")
            }
            
            else if !didSelectProduct{
                throwAlert(alertMessage: "Select product first")

            }
            else{
                if productIndex > -1{
                    products[productIndex].quantity += Int(restockQuantity)!
                    throwAlert(alertMessage: "Item restocked")
                    restockTable.reloadData()
                }
                
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectProduct = true;
        productIndex = indexPath.row;
    }
    
    
    var products: [ProductModel] {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.allProducts
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restockCell") ??
                   UITableViewCell(style: .subtitle, reuseIdentifier: "restockCell")
        let productInCell = products[indexPath.row];
        cell.textLabel?.text="\(productInCell.name)"
        cell.detailTextLabel?.text = "\(productInCell.quantity)"
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restockTable.delegate = self
        restockTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
