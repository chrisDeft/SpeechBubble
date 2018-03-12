//
//  ViewController.swift
//  SpeechBubble
//
//  Created by Chris Adamson on 05/10/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testPhrase = SpeechBubble(point: CGPoint(x: 50, y: 50), text: "Talk is cheap. Show me the code. - Linus Torvalds", type: .topRight, color: .brown)
        
        let anotherPhrase = SpeechBubble(point: CGPoint(x: 50, y:160), text: "A good programmer is someone who always looks both ways before crossing a one-way street. - Doug Linder", type: .topLeft, color: .green)
        
        let moreText = SpeechBubble(point: CGPoint(x: 50, y: 310), text: "Truth can only be found in one place: the code. - Robert C Martin", type: .bottomRight, color: .blue)
        
        let finalPhrase = SpeechBubble(point: CGPoint(x: 50, y: 470), text: "Walking on water and developing software from a specification are easy if both are frozen. - Edward V Berard", type: .bottomLeft, color: .red)
        
        self.view.addSubview(testPhrase)
        self.view.addSubview(anotherPhrase)
        self.view.addSubview(moreText)
        self.view.addSubview(finalPhrase)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

