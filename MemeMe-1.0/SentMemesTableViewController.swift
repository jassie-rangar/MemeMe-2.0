//
//  SentMemesTableViewController.swift
//  MemeMe-2.0
//
//  Created by Jaskirat Singh on 04/01/18.
//  Copyright © 2018 jassie. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UITableViewController
{

    // MARK: Outlets
    @IBOutlet weak var add: UIBarButtonItem!
    
    var memes: [MemeMe]
    {
        return(UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        // MARK: Code to set Tab_bar and Nav_bar hidden properties
        tabBarController?.tabBar.isHidden = false
        navigationController?.isNavigationBarHidden = false
       
        // Mark: Reloading tables with memed data
        tableView?.reloadData()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return memes.count
    }
    
    
    // MARK: Return no of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return memes.count
    }

    // MARK: Setting cell for row at index
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SentMemesTableViewCell", for: indexPath) as! SentMemesTableViewCell
        
        // MARK: Setting image and label
        cell.memedImage?.image = memes[indexPath.row].memedImage
        cell.textLabel?.text = memes[indexPath.row].topText + "......." + memes[indexPath.row].bottomText
        
        return cell
    }

    // MARK: Setting the object of MemeDetailViewController from storyboard
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let memeDetail = self.storyboard?.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        memeDetail.meme = memes[indexPath.row]
        
        // MARK: Pushing to the viewcontroller
        navigationController?.pushViewController(memeDetail, animated: true)
    }
    
    // MARK: Code to perfrom editing
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        // performing delete action
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            (UIApplication.shared.delegate as! AppDelegate).memes.remove(at: indexPath.row)
            
            //reloading view after editing
            tableView.reloadData()
        }
    }
 }
