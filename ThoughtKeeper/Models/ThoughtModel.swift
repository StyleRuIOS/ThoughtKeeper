//
//  ThoughtModel.swift
//  ThoughtKeeper
//
//  Created by user on 20/11/2019.
//  Copyright © 2019 Бизнес в стиле .RU. All rights reserved.
//

import Foundation

class Thought {
    var id: Int
    var text: String
    var category: ThoughtCategory

    init(id: Int, text: String, category: ThoughtCategory) {
        self.id = id
        self.text = text
        self.category = category
    }
}
