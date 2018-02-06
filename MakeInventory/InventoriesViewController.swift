//
//  ViewController.swift
//  MakeInventory
//
//  Created by Eliel A. Gordon on 11/12/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit
import CoreData

class InventoriesViewController: UIViewController {
    
    private let stack = CoreDataStack.instance
    var inventories = [Inventory]()
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - RETURN VALUES
    
    // MARK: - VOID METHODS
    
    // MARK: - IBACTIONS
    
    @IBAction func pressDone(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let fetch = NSFetchRequest<Inventory>(entityName: "Inventory")
        do {
            let result = try stack.viewContext.fetch(fetch)
            self.inventories = result
            self.tableView.reloadData()
            
        } catch {
            print(error)
        }
    }
}


extension InventoriesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventories.count
    }
}

extension InventoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let item = inventories[indexPath.row]
        
        cell.labelTitle.text = item.title
        cell.labelCount.text = "x\(item.quantity)"
        cell.labelDateCreated.text = "Created at: \(item.dateCreated!)"
        
        return cell
    }
}
