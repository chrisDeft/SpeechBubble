//
//  SpeechBubble.swift
//  SpeechBubble
//
//  Created by Chris Adamson on 05/10/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

import UIKit
import Foundation

enum SpeechBubbleStyle {
    case topRight
    case topLeft
    case bottomRight
    case bottomLeft
}

class SpeechBubble: UIView {
    
    let maxHeight = 250
    let maxWidth = 250
    let paddingSize:CGFloat = 20.0
    let strokeWidth:CGFloat = 4.0
    let pointSize:CGFloat = 14.0
    let font:UIFont = UIFont(name: "Avenir-Medium", size: 16.0)!
    let textColor:UIColor = .darkGray
    
    var size: CGSize
    var rect: CGRect
    var text: String
    var type: SpeechBubbleStyle
    var color: UIColor
    
    init(point: CGPoint, text: String, type: SpeechBubbleStyle, color: UIColor) {
        
        self.size = text.boundingRect(with: CGSize(width:maxWidth, height:maxHeight), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:font], context: nil).size
        
        self.rect = CGRect(x: point.x, y: point.y, width: CGFloat(size.width+paddingSize*2), height: size.height+paddingSize*2+pointSize)
        self.text = text
        self.type = type
        self.color = color
        
        super.init(frame: rect)
        
        self.backgroundColor = UIColor.clear
        
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 8
        self.layer.shadowOffset = CGSize(width: -5, height: 8)
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 0.5
        
        
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func drawText () {
        
        var outlineRect = self.bounds
        outlineRect.origin.x += paddingSize
        outlineRect.origin.y += paddingSize + (pointSize/2)
        outlineRect.size.width -= paddingSize*2.0
        outlineRect.size.height -= paddingSize*2.0
        
        let textString: NSString = text as NSString
        
        textString.draw(in: outlineRect, withAttributes: [NSAttributedStringKey.font:font,NSAttributedStringKey.foregroundColor:textColor])
        
    }
    
    func drawOutline (type: SpeechBubbleStyle) {
        
        var outlineRect = self.bounds
        outlineRect.origin.x += strokeWidth/2
        outlineRect.origin.y += strokeWidth + pointSize
        outlineRect.size.width -= strokeWidth
        outlineRect.size.height -= strokeWidth*1.5 + pointSize*2
        
        let radius:CGFloat = 8.0
        let x_left:CGFloat = outlineRect.origin.x
        let x_right:CGFloat = x_left + outlineRect.size.width
        let y_top:CGFloat = outlineRect.origin.y
        let y_bottom:CGFloat = y_top + outlineRect.size.height
        
        let speechBubble = UIBezierPath()
        
        speechBubble.addClip()
        
        speechBubble.lineWidth = strokeWidth
        
        switch type {
            
        case .bottomRight:
            
            speechBubble.move(to: CGPoint(x: x_right-radius-pointSize, y: y_top))
            
            speechBubble.addArc(withCenter: CGPoint(x: x_right-radius,y: y_top+radius), radius: radius, startAngle: CGFloat(3.0*Float.pi/2.0), endAngle: 0.0, clockwise: true)
            speechBubble.addArc(withCenter: CGPoint(x: x_right-radius,y: y_bottom-radius), radius: radius, startAngle: 0.0, endAngle: CGFloat(.pi/2.0), clockwise: true)
            
            speechBubble.addLine(to: CGPoint(x: x_right-radius, y: y_bottom+pointSize))
            speechBubble.addLine(to: CGPoint(x: x_right-radius-pointSize, y: y_bottom))
            
            speechBubble.addArc(withCenter: CGPoint(x: x_left+radius,y: y_bottom-radius), radius: radius, startAngle: .pi/2.0, endAngle: .pi, clockwise: true)
            speechBubble.addArc(withCenter: CGPoint(x: x_left+radius,y: y_top+radius), radius: radius, startAngle: .pi, endAngle: CGFloat(3.0*Float.pi/2.0), clockwise: true)
            
        case .bottomLeft:
            
            speechBubble.move(to: CGPoint(x: x_right-radius-pointSize, y: y_top))
            
            speechBubble.addArc(withCenter: CGPoint(x: x_right-radius,y: y_top+radius), radius: radius, startAngle: CGFloat(3.0*Float.pi/2.0), endAngle: 0.0, clockwise: true)
            speechBubble.addArc(withCenter: CGPoint(x: x_right-radius,y: y_bottom-radius), radius: radius, startAngle: 0.0, endAngle: CGFloat(.pi/2.0), clockwise: true)
            
            speechBubble.addLine(to: CGPoint(x: x_left+radius+pointSize, y: y_bottom))
            speechBubble.addLine(to: CGPoint(x: x_left+radius, y: y_bottom+pointSize))
            
            speechBubble.addArc(withCenter: CGPoint(x: x_left+radius,y: y_bottom-radius), radius: radius, startAngle: .pi/2.0, endAngle: .pi, clockwise: true)
            speechBubble.addArc(withCenter: CGPoint(x: x_left+radius,y: y_top+radius), radius: radius, startAngle: .pi, endAngle: CGFloat(3.0*Float.pi/2.0), clockwise: true)
            
        case .topRight:
            
            speechBubble.move(to: CGPoint(x: x_right-radius-pointSize, y: y_top))
            speechBubble.addLine(to: CGPoint(x: x_right-radius-pointSize, y: y_top))
            speechBubble.addLine(to: CGPoint(x: x_right-radius, y: y_top-pointSize))
            
            speechBubble.addArc(withCenter: CGPoint(x: x_right-radius,y: y_top+radius), radius: radius, startAngle: CGFloat(3.0*Float.pi/2.0), endAngle: 0.0, clockwise: true)
            speechBubble.addArc(withCenter: CGPoint(x: x_right-radius,y: y_bottom-radius), radius: radius, startAngle: 0.0, endAngle: CGFloat(.pi/2.0), clockwise: true)
            speechBubble.addArc(withCenter: CGPoint(x: x_left+radius,y: y_bottom-radius), radius: radius, startAngle: .pi/2.0, endAngle: .pi, clockwise: true)
            speechBubble.addArc(withCenter: CGPoint(x: x_left+radius,y: y_top+radius), radius: radius, startAngle: .pi, endAngle: CGFloat(3.0*Float.pi/2.0), clockwise: true)
            
        case .topLeft:
            
            speechBubble.move(to: CGPoint(x: x_left+radius, y: y_top))
            speechBubble.addLine(to: CGPoint(x: x_left+radius, y: y_top-pointSize))
            speechBubble.addLine(to: CGPoint(x: x_left+radius+pointSize, y: y_top))
            
            speechBubble.addArc(withCenter: CGPoint(x: x_right-radius,y: y_top+radius), radius: radius, startAngle: CGFloat(3.0*Float.pi/2.0), endAngle: 0.0, clockwise: true)
            speechBubble.addArc(withCenter: CGPoint(x: x_right-radius,y: y_bottom-radius), radius: radius, startAngle: 0.0, endAngle: CGFloat(.pi/2.0), clockwise: true)
            speechBubble.addArc(withCenter: CGPoint(x: x_left+radius,y: y_bottom-radius), radius: radius, startAngle: .pi/2.0, endAngle: .pi, clockwise: true)
            speechBubble.addArc(withCenter: CGPoint(x: x_left+radius,y: y_top+radius), radius: radius, startAngle: .pi, endAngle: CGFloat(3.0*Float.pi/2.0), clockwise: true)
            
        }
        
        speechBubble.close()
        
        color.setStroke()
        
        speechBubble.stroke()
        
        UIColor.white.setFill()
        
        speechBubble.fill()
    
        
    }
    
    override func draw(_ rect: CGRect) {
        
        // Drawing code
        self.drawOutline(type: type)
        self.drawText()
        
        
    }


    

}
