//
//  HistoryViewController.swift
//  CashRegisterApp
//
//  Created by Aditya Purohit on 17/10/24.
//

import UIKit

class HistoryViewController: UIViewController, ,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var historyTable: UITableView!
    var purchasedProducts: [HistoryModel] {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.historyItems
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchasedProducts.count;
    }
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTable.delegate = self
        historyTable.dataSource = self

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
