//
//  SnapsViewController.swift
//  Snapchat
//
//  Created by Nabeel Khan on 10/19/16.
//  Copyright © 2016 Nabeel Khan. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutTapped(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }

}
