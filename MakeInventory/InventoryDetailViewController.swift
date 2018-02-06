//
//  AddInventoryViewController.swift
//  MakeInventory
//
//  Created by Eliel A. Gordon on 11/12/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit

class InventoryDetailViewController: UIViewController {
    let coreDataStack = CoreDataStack.instance
    
    @IBOutlet weak var textFieldTitle: UITextField!
    @IBOutlet weak var textFieldQuanity: UITextField!
    
    var detailedInventory: Inventory?
    
    // MARK: - RETURN VALUES
    
    // MARK: - VOID METHODS
    
    // MARK: - IBACTIONS
    
    @IBAction func pressedCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func savePressed(_ sender: Any) {
        guard let titleValue = textFieldTitle.text, let quantityValue = Int64(textFieldQuanity.text!) else {
            let alertError = UIAlertController(title: "Saving", message: "enter both a valid title and quanity", preferredStyle: .alert)
            alertError.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertError, animated: true)
            
            return
        }
        
        let context = coreDataStack.privateContext
        if let editingInventory = detailedInventory {
            editingInventory.title = titleValue
            editingInventory.quantity = quantityValue
        } else {
            Inventory(title: titleValue, count: quantityValue, in: context)
        }
        coreDataStack.saveTo(context: context)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - LIFE CYCLE
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let inventory = detailedInventory {
            textFieldTitle.text = inventory.title
            textFieldQuanity.text = String(inventory.quantity)
        } else {
            textFieldTitle.text = "Untitled"
        }
    }
}
