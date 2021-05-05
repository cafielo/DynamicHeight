//
//  ViewController.swift
//  DynamicHeight
//
//  Created by joonwon lee on 2021/05/04.
//

import UIKit

class ViewController: UIViewController {
    let items: [Item] = [
        Item(title: "Lorem ipsum dolor sit amet, consectetur"),
        Item(title: "adipiscing elit, sed do eiusmod tempor"),
        Item(title: "incididunt ut labore et dolore magna aliqua"),
        Item(title: "Ut enim ad minim veniam"),
        Item(title: "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        Item(title: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DynamicCell", for: indexPath) as? DynamicCell else { return UICollectionViewCell() }
        
        let item = items[indexPath.item]
        cell.text.text = item.title
        cell.contentWidth.constant = collectionView.bounds.width
        return cell
    }
}

class DynamicCell: UICollectionViewCell {
    
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var contentWidth: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false       
    }
}

struct Item {
    let title: String
}
