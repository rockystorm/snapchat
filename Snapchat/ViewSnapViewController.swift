//
//  ViewSnapViewController.swift
//  Snapchat
//
//  Created by Nabeel Khan on 10/20/16.
//  Copyright © 2016 Nabeel Khan. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class ViewSnapViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var snap = Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor .black
        // Do any additional setup after loading the view.
        label.text = snap.describer
        imageView.sd_setImage(with: URL(string: snap.imageUrl))
        
        print("UUID: \(snap.uuid)")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").child(snap.key).removeValue()
        
        FIRStorage.storage().reference().child("images").child("\(snap.uuid).jpg").delete { (error) in
            print("we deleted \(self.snap.uuid)!")
        }
        
    }

}
