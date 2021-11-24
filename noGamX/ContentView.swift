import SwiftUI
import CoreData
import SpriteKit


// A simple game scene with falling boxes
class GameScene: SKScene {
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.gravity = CGVector(dx: 0.0, dy: -9.8)
        let background = SKSpriteNode(imageNamed: "wallpaper")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: CGFloat(2000), height: self.frame.size.height)
        addChild(background)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let randomInt = Int.random(in: 1..<6)
        var boxColor = SKColor.red
        var boxWidth = 50
        var boxHeight = 50
        switch randomInt {
            case 1:
                boxColor = SKColor.green
                boxWidth = 40
                boxHeight = 40
                physicsWorld.gravity = CGVector(dx: 0.0, dy: -4.8)
                let box = SKSpriteNode(color: boxColor, size: CGSize(width: boxWidth, height: boxHeight))
                box.position = location
                box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: boxWidth, height: boxHeight))
                addChild(box)
            case 2:
                boxColor = SKColor.blue
                boxWidth = 60
                boxHeight = 60
                physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.5)
                let texture1 = SKTexture(imageNamed: "a")
                let arrow = SKSpriteNode(texture: texture1, color: UIColor.purple, size: CGSize(width: boxWidth, height: boxHeight))
                arrow.position = location
                arrow.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: boxWidth, height: boxHeight))
                addChild(arrow)
            case 3:
                boxColor = SKColor.yellow
                boxWidth = 30
                boxHeight = 30
                physicsWorld.gravity = CGVector(dx: 0.0, dy: -7.7)
                let box = SKSpriteNode(color: boxColor, size: CGSize(width: boxWidth, height: boxHeight))
                box.position = location
                box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: boxWidth, height: boxHeight))
                addChild(box)
            case 4:
                boxColor = SKColor.cyan
                boxWidth = 44
                boxHeight = 44
                physicsWorld.gravity = CGVector(dx: 0.0, dy: -15.0)
                let box = SKSpriteNode(color: boxColor, size: CGSize(width: boxWidth, height: boxHeight))
                //box.scale(to: <#T##CGSize#>)
                box.position = location
                box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: boxWidth, height: boxHeight))
                addChild(box)
            case 5:
                boxColor = SKColor.magenta
                boxWidth = 50
                boxHeight = 50
                physicsWorld.gravity = CGVector(dx: 0.0, dy: -9.8)
                let box = SKSpriteNode(color: boxColor, size: CGSize(width: boxWidth, height: boxHeight))
                //box.scale(to: <#T##CGSize#>)
                box.position = location
                box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: boxWidth, height: boxHeight))
                addChild(box)
            default:
                boxColor = SKColor.cyan
                boxWidth = 50
                boxHeight = 50
                let box = SKSpriteNode(color: boxColor, size: CGSize(width: boxWidth, height: boxHeight))
                box.position = location
                box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: boxWidth, height: boxHeight))
                addChild(box)
        }
    }
}

// A sample SwiftUI creating a GameScene and sizing it
// at 300x400 points
struct ContentView: View {
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: 300, height: 400)
        scene.scaleMode = .resizeFill
        return scene
    }

    var body: some View {
        VStack {
            GeometryReader { geo in
                SpriteView(scene: scene)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .ignoresSafeArea()
            }
           
            Button("Clean", action: clean).edgesIgnoringSafeArea(.bottom)
        }
    }
    func clean() {
        
    }
}
