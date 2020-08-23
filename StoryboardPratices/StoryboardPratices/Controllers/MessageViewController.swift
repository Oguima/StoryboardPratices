//
//  MessageViewController.swift
//  StoryboardPratices
//
//  Created by user179081 on 23/08/20.
//  Copyright © 2020 guimagames. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController, MainProtocol {

    @IBOutlet weak var message_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func returned(_ seg: UIStoryboardSegue)
    {
        print("Returned")
    }
    
    func handleData(message: String) {
        message_label.text = message
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dataSegue", let vc = segue.destination as? SetDataViewController {
            
            //test
            vc.delegate = self
        }
    }

}
