//
//  ThoughtsTableViewController.swift
//  ThoughtKeeper
//
//  Created by user on 20/11/2019.
//  Copyright © 2019 Бизнес в стиле .RU. All rights reserved.
//

import UIKit

class ThoughtsTableViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var collectionView: UICollectionView!

    //MARK:- Properites
    private var storedThought = [Thought]()
    private var storedCategories = [ThoughtCategory]()

    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    //MARK:- IBActions
    @IBAction func addButtonPressed(_ sender: Any) {
        showThoughtEnteringView()
    }

    //MARK:- Routing
    private func showThoughtEnteringView() {
        let thoughtInputAlertController = ThoughtInputAlertController(title: "New thought", message: nil, preferredStyle: .alert)
        thoughtInputAlertController.delegate = self
        present(thoughtInputAlertController, animated: true, completion: nil)
    }
}

//MARK:- CollectionView Delegate
extension ThoughtsTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storedThought.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Main Cell", for: indexPath) as! ThoughtCollectionViewCell
        cell.textLabel.text = storedThought[indexPath.row].text
        cell.tagLabel.text = storedThought[indexPath.row].category.title
        return cell
    }
}

//MARK:- CollectionView Displaying
extension ThoughtsTableViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let concideredSize = CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width / 2)
        return concideredSize
    }
}

//MARK:- ThoughtInputDelegate
extension ThoughtsTableViewController: ThoughtInputDelegate {

   func updateEnteredThought(text: String) {
          let thought = Thought(id: 0, text: text, category: ThoughtCategory(id: 0, title: "Useless"))
          storedThought.append(thought)
          collectionView.reloadData()
      }
}
