import SwiftUI

struct LauncherView: View {
    @State private var host = ""
    @State private var status = "جاهز — اربط جهاز الكمبيوتر عبر Sunshine"
    @State private var isConnecting = false

    var body: some View {
        ZStack {
            Color(red: 0.035, green: 0.045, blue: 0.065).ignoresSafeArea()
            VStack(spacing: 22) {
                Spacer()
                Image(systemName: "gamecontroller.fill")
                    .font(.system(size: 54)).foregroundStyle(.cyan)
                Text("YOX ENGINE").font(.system(size: 30, weight: .black, design: .rounded))
                    .foregroundStyle(.white)
                Text("PC GAME STREAMING").font(.caption.weight(.semibold))
                    .tracking(3).foregroundStyle(.gray)
                TextField("عنوان الكمبيوتر (مثال 192.168.1.20)", text: $host)
                    .textInputAutocapitalization(.never).autocorrectionDisabled()
                    .keyboardType(.numbersAndPunctuation)
                    .padding().background(.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 14))
                    .foregroundStyle(.white)
                Button {
                    isConnecting = true
                    status = "واجهة الربط التجريبية فقط — يلزم دمج Moonlight Core"
                    YoxMoonlightBridge.shared.prepare(host: host)
                    isConnecting = false
                } label: {
                    HStack { Image(systemName: "play.fill"); Text("اتصال") }
                        .frame(maxWidth: .infinity).padding()
                        .background(Color.cyan, in: RoundedRectangle(cornerRadius: 14))
                        .foregroundStyle(.black).fontWeight(.bold)
                }.disabled(host.isEmpty || isConnecting)
                Text(status).font(.footnote).foregroundStyle(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                Spacer()
                Text("Yox Engine • Streaming UI scaffold")
                    .font(.caption2).foregroundStyle(.gray)
            }.padding(24)
        }
    }
}
