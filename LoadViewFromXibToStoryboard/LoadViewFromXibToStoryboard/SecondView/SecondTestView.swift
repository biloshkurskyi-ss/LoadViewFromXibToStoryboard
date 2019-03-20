//
//  SecondTestView.swift
//  LoadViewFromXibToStoryboard
//
//  Created by Sergey Biloshkurskyi on 3/20/19.
//  Copyright © 2019 Sergey Biloshkurskyi. All rights reserved.
//

import UIKit

class SecondTestView: XibView {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBAction func onButton(_ sender: UIButton) {
        print("onButton # 2")
    }
}
