import SwiftUI
import MetalKit

struct YoxMetalView: UIViewRepresentable {
    func makeUIView(context: Context) -> MTKView {
        let view = MTKView(frame: .zero, device: MTLCreateSystemDefaultDevice())
        view.colorPixelFormat = .bgra8Unorm
        view.clearColor = MTLClearColor(red: 0.02, green: 0.025, blue: 0.04, alpha: 1)
        view.isPaused = true
        view.enableSetNeedsDisplay = true
        return view
    }
    func updateUIView(_ view: MTKView, context: Context) {}
}
