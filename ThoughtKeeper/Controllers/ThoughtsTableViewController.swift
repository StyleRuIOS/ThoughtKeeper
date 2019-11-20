//
//  ThoughtsTableViewController.swift
//  ThoughtKeeper
//
//  Created by user on 20/11/2019.
//  Copyright © 2019 Бизнес в стиле .RU. All rights reserved.
//

import UIKit

class ThoughtsTableViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var storedThought = [Thought]()
    private var storedCategories = [ThoughtCategory]()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        createCategories()
        createThoughts()
    }

    private func createThoughts() {
        for index in 0 ..< 10 {
            let categoryForThought = storedCategories[index % 2]
            let thought = Thought(id: index, text: "I think, that ...", category: categoryForThought)
            storedThought.append(thought)
        }
    }

    private func createCategories() {
        storedCategories.append(ThoughtCategory(id: 0, title: "Useless"))
        storedCategories.append(ThoughtCategory(id: 1, title: "Painfull"))
    }
}

//MARK:- CollectionView Delegate
extension ThoughtsTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storedThought.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row % 2 == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Main Cell", for: indexPath) as! ThoughtCollectionViewCell
            cell.textLabel.text = storedThought[indexPath.row].text
            cell.tagLabel.text = storedThought[indexPath.row].category.title
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Secondary Cell", for: indexPath)
            return cell
        }
        
    }
}

//MARK:- CollectionView Displaying
extension ThoughtsTableViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let concideredSize = CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width / 2)
        return concideredSize
    }
}
