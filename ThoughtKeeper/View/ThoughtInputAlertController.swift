//
//  ThoughtInputAlertController.swift
//  ThoughtKeeper
//
//  Created by Sergey on 11/27/19.
//  Copyright © 2019 Бизнес в стиле .RU. All rights reserved.
//

import UIKit

protocol ThoughtInputDelegate: class {
    ///Update UI with provided text
    func updateEnteredThought(text: String)
}

class ThoughtInputAlertController: UIAlertController {

    //MARK:- Properties
    weak var delegate: ThoughtInputDelegate?

    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createTextField()
        addActions()
    }

    //MARK:- Methods
    private func createTextField() {
        self.addTextField { (textField) in
            textField.placeholder = "Enter your new thought..."
        }
    }

    private func addActions() {
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            if let textField = self.textFields?.first {
                self.delegate?.updateEnteredThought(text: textField.text!)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        self.addAction(addAction)
        self.addAction(cancelAction)
    }
}
