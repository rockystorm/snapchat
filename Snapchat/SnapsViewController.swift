//
//  SnapsViewController.swift
//  Snapchat
//
//  Created by Nabeel Khan on 10/19/16.
//  Copyright © 2016 Nabeel Khan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class SnapsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    
    var snaps : [Snap] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self

        FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").observe(FIRDataEventType.childAdded, with: {(snapshot) in
            print(snapshot)
            
            let snap = Snap()
            snap.imageUrl = (snapshot.value as! NSDictionary)["imageUrl"] as! String
            snap.from = (snapshot.value as! NSDictionary)["from"] as! String
            snap.describer = (snapshot.value as! NSDictionary)["description"] as! String
            
            self.snaps.append(snap)
            self.tableView.reloadData()
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snaps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let snap = snaps[indexPath.row]
        cell.textLabel?.text = snap.from
        return cell
    }
    
    @IBAction func logoutTapped(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

}
