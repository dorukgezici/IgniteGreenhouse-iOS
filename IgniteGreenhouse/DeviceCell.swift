//
//  DeviceCell.swift
//  IgniteGreenhouse
//
//  Created by Doruk Gezici on 29/06/2017.
//  Copyright © 2017 ARDIC. All rights reserved.
//

import UIKit

class DeviceCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    func configureCell(device: Device) {
        idLabel.text = device.deviceId
        statusLabel.text = device.state
    }
    
}
