//
//  LightViewController.swift
//  TheLight
//
//  Created by Stanislav Lemeshaev on 27.08.2021.
//  Copyright © 2021 slemeshaev. All rights reserved.
//

import UIKit

class LightViewController: UIViewController {
    
    // MARK: - Properties
    private var isLightOn = true
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateState()
    }
    
    // MARK: - Interface
    @IBAction func toggleLightTapped() {
        isLightOn.toggle()
        updateState()
    }
    
    // MARK: - Internal
    private func updateState() {
        view.backgroundColor = isLightOn ? .white : .black
    }
}
