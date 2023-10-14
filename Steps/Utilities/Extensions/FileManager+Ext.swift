//
//  FileManager+Ext.swift
//  Steps
//
//  Created by Raphael on 05.10.23.
//

import Foundation

extension FileManager {
    func documentsDirectory() -> URL {
        let path = urls(for: .documentDirectory, in: .userDomainMask)
        return path.first!
    }
}
