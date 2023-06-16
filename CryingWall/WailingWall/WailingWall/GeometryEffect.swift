import SwiftUI

struct WailGeometryEffect: GeometryEffect {
    
    var time: Double
    var speed = Double.random(in: 100...200)
    var xDirection = Double.random(in: -0.4...0.4)
    var yDirection = Double.random(in: -Double.pi...0)
    
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = speed * xDirection
        let yTranslation = speed * sin(yDirection) * time * 3
        let affineTranslation = CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
    
}
