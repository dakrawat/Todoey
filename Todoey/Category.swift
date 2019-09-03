//
//  Category.swift
//  Todoey
//
//  Created by Deepak on 9/3/19.
//  Copyright © 2019 Deepak. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
