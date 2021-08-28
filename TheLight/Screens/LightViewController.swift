//
//  LightViewController.swift
//  TheLight
//
//  Created by Stanislav Lemeshaev on 27.08.2021.
//  Copyright © 2021 slemeshaev. All rights reserved.
//

import UIKit
import AVFoundation

class LightViewController: UIViewController {
    
    // MARK: - Properties
    private var isLightOn = false
    private var touchСounter = 0
    
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
        isLightOn.toggle()
        toggleTorch(on: isLightOn)
    }
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard device.hasTorch else {
            print("Torch isn't available")
            return
        }
        
        do {
            try device.lockForConfiguration()
            device.torchMode = on ? .on : .off
            
            // Optional thing you may want when the torch it's on, is to manipulate the level of the torch
            if on {
                try device.setTorchModeOn(level: 1.0)
            }
            
            device.unlockForConfiguration()
        } catch {
            print("Torch can't be used")
        }
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
