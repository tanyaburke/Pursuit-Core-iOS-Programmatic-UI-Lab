//
//  ViewController.swift
//  Pursuit-Core-iOS-Programmatic-UI-Lab
//
//  Created by Tanya Burke on 1/29/20.
//  Copyright © 2020 Tanya Burke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    private var mainView = View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view = mainView
        addTargetAction()
    }

    func addTargetAction(){
        mainView.blueButton.addTarget(self, action: #selector(mainView.colorLogic(_:)), for: .touchUpInside)
        mainView.redButton.addTarget(self, action: #selector(mainView.colorLogic(_:)), for: .touchUpInside)
        mainView.greenButton.addTarget(self, action: #selector(mainView.colorLogic(_:)), for: .touchUpInside)
    }
}

