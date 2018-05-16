//
//  ViewController.swift
//  StormViewer
//
//  Created by Grace on 16/05/2018.
//  Copyright © 2018 Grace. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //we'll be using file manager to look for files
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        //the try keyword means the following code has a potential of going wrong but i'm certain it won't
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("unsplash") {
                pictures.append(item)
            }
        }
        
        print(pictures)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

