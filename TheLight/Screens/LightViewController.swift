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
    private var touchСounter: Int = 0
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateState()
    }
    
    // MARK: - Interface
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        updateState()
    }
    
    // MARK: - Internal
    private func updateState() {
        touchСounter += 1
        switch touchСounter {
        case 1:
            view.backgroundColor = .red
        case 2:
            view.backgroundColor = .yellow
        case 3:
            view.backgroundColor = .green
            touchСounter = 0
        default:
            break
        }
    }
}
