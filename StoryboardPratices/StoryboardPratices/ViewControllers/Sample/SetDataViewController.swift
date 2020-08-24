//
//  SetDataViewController.swift
//  StoryboardPratices
//
//  Created by user179081 on 23/08/20.
//  Copyright © 2020 guimagames. All rights reserved.
//

import UIKit

class SetDataViewController: UIViewController {

    weak var delegate: MessageViewController?
    
    @IBOutlet weak var text_field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "returnedSegue", let text = text_field.text {
            delegate?.handleData(message: text)
        }
    }
}
