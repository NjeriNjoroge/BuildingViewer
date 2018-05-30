//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Grace on 17/05/2018.
//  Copyright © 2018 Grace. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageViewer: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        
        /*
         #selector tells the Swift compiler that a method called "shareTapped" will exist, and should be triggered when the button is tapped
        */
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageViewer.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    @objc func shareTapped() {
        let vc = UIActivityViewController(activityItems: [imageViewer.image!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return navigationController?.hidesBarsOnTap ?? false
    }

}
