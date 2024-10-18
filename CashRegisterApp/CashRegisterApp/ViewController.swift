//
//  ViewController.swift
//  CashRegisterApp
//
//  Created by Aditya Purohit on 07/10/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var productTable: UITableView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    var productQuantity = 0
    var productPrice = 0.0
    var selectedProductIndex = 0;
    
    func throwAlert(alertMessage: String){
        
        let alert = UIAlertController(title: "\(alertMessage)", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
        
    }
    
    @IBAction func buyProduct(_ sender: Any) {
        
        if typeLabel.text == "Type"{throwAlert(alertMessage: "Select product first")}
        else{
            let quantity = Int(quantityLabel.text!)
            
            if quantity! > productQuantity{
                
                throwAlert(alertMessage: "Quantity greater than stock")
                
            }
            
            else{
                throwAlert(alertMessage: "Order placed succesfully")
                print(selectedProductIndex)
                let quantityToSubtract = Int(quantityLabel.text!)
                products[selectedProductIndex].quantity -=
                quantityToSubtract!
                
                let purchasedProduct = HistoryModel(
                    name: products[selectedProductIndex].name,
                    quantity: products[selectedProductIndex].quantity,
                    price: products[selectedProductIndex].price
                )
                
                (UIApplication.shared.delegate as! AppDelegate).historyItems.append(purchasedProduct)

                productTable.reloadData()
                quantityLabel.text = "";
                totalLabel.text = "";
                typeLabel
                    .text = "Type";
                
                
            }
        }
        
    }
    func changeQuantity(_ numberClicked:String){
        if typeLabel.text! == "Type"{
            throwAlert(alertMessage: "Select product first");
        }
        else{
            quantityLabel.text! += "\(numberClicked)"
            let quantity = Int(quantityLabel.text!)
            totalLabel.text = "\(quantity! * productQuantity)";
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let buttonTitle = sender.titleLabel!.text!;

        switch sender.tag {
        case 0...9:
            changeQuantity("\(buttonTitle)");
        default:
            break
        }
    }
    
    var products: [ProductModel] {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            return appDelegate.allProducts
        }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ??
                   UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let productInCell = products[indexPath.row];
        cell.textLabel?.text="\(productInCell.name)  \(productInCell.quantity)"
        cell.detailTextLabel?.text = "\(productInCell.price)"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let product = products[indexPath.row]
        productQuantity = product.quantity;
        productPrice = product.price;
        selectedProductIndex = indexPath.row
        typeLabel.text = "\(product.name)";
        quantityLabel.text = "";
        totalLabel.text = "";
        
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Initialize and set up the table view
        // Set delegate and dataSource for the tableView
        productTable.delegate = self
        productTable.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        productTable.reloadData()
    }


}

