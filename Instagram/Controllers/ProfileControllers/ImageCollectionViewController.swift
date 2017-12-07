//
//  ImageCollectionViewController.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/7/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

protocol ImageCollectionViewControllerDelegate: class {
    func cellTapped()
}

class ImageCollectionViewController: UICollectionViewController {
    let images: [UIImage] = Constants.images
    
    weak var delegate: ImageCollectionViewControllerDelegate?
    
    init() {
        let layout = UICollectionViewFlowLayout() 
        let cellSize = UIScreen.main.bounds.width / 3 - 1
        
        layout.itemSize = CGSize(width: cellSize, height: cellSize)
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView?.showsHorizontalScrollIndicator = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
        cell.itemImageView.image = images[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped -> \(indexPath.row)th item")
        delegate?.cellTapped()
    }
}