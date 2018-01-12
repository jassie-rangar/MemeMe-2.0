//
//  MemeDetailViewController.swift
//  MemeMe-2.0
//
//  Created by Jaskirat Singh on 05/01/18.
//  Copyright © 2018 jassie. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController
{

    var meme : MemeMe!
    
    @IBOutlet weak var imageView: UIImageView!
    
    // Mark: Code to hide Status Bar
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        // MARK: Code to hide Tab Bar Controller
        tabBarController?.tabBar.isHidden = true
        
        // MARK: Setting the memed image to show
        imageView.image = meme.memedImage
    }

}
