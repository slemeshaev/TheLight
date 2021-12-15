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
    
    enum StateLight: Int {
        case red = 1
        case yellow = 2
        case green = 3
    }
    
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
    
    // MARK: - Private
    private func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard device.hasTorch else {
            print("Torch isn't available")
            return
        }
        
        do {
            try device.lockForConfiguration()
            device.torchMode = on ? .on : .off
            
            if on {
                try device.setTorchModeOn(level: 1.0)
            }
            
            device.unlockForConfiguration()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func updateState() {
        touchСounter += 1
        
        switch StateLight(rawValue: touchСounter) {
        case .red:
            view.backgroundColor = .red
        case .yellow:
            view.backgroundColor = .yellow
        case .green:
            view.backgroundColor = .green
            touchСounter = 0
        case .none:
            break
        }
    }
}
