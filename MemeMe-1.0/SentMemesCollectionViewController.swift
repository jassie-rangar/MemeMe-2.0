//
//  SentMemesCollectionViewController.swift
//  MemeMe-2.0
//
//  Created by Jaskirat Singh on 04/01/18.
//  Copyright © 2018 jassie. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SentMemesCollectionViewController: UICollectionViewController
{
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [MemeMe]
    {
        return(UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let space: CGFloat
        let dimension: CGFloat
        
        
        if(UIDeviceOrientationIsLandscape(UIDevice.current.orientation))
        {
            space = 1.0
            dimension = (view.frame.size.width - (1 * space)) / 5
        }
        else
        {
            space = 2.0
            dimension = (view.frame.size.width - (2 * space)) / 3
        }
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
        
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        // MARK: Code to set Tab_bar and Nav_bar hidden properties
        tabBarController?.tabBar.isHidden = false
        navigationController?.isNavigationBarHidden = false
        
        // Mark: Reloading collection with memed data
        collectionView?.reloadData()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Return no of rows
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
        // return the number of items
        return memes.count
    }

     // MARK: Setting cell for item at index
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemesCollectionViewCell", for: indexPath) as! SentMemesCollectionViewCell
        cell.imageView?.image = memes[indexPath.row].memedImage
        return cell
    }
    
    // MARK: Setting the object of MemeDetailViewController from storyboard
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let memeDetail = self.storyboard?.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        memeDetail.meme = memes[indexPath.row]
        
        // MARK: Pushing to the viewcontroller
        navigationController?.pushViewController(memeDetail, animated: true)
    }
}
