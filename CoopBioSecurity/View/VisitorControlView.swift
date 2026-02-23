import SwiftUI

struct VisitorControlView: View {
    @AppStorage("requireShoeDisinfection") private var requireShoeDisinfection: Bool = false
    @AppStorage("requestShoePhoto") private var requestShoePhoto: Bool = false
    @AppStorage("logEntryTime") private var logEntryTime: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("80% of infections are brought by people and animals.")
                    .font(.headline)
                    .foregroundColor(.textDarkBrown)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.cardSandYellow)
                    .cornerRadius(15)
                
                Text("Visitor Log")
                    .padding()
                    .background(Color.cardSandYellow)
                    .cornerRadius(10)
                
                Text("Protective Clothing Usage")
                    .padding()
                    .background(Color.cardSandYellow)
                    .cornerRadius(10)
                
                Text("Access Zones")
                    .padding()
                    .background(Color.cardSandYellow)
                    .cornerRadius(10)
                
                Text("Entry Rules")
                    .padding()
                    .background(Color.cardSandYellow)
                    .cornerRadius(10)
                
                Toggle("Require shoe disinfection", isOn: $requireShoeDisinfection)
                    .toggleStyle(SwitchToggleStyle(tint: .accentOrange))
                    .padding()
                    .background(Color.cardSandYellow)
                    .cornerRadius(10)
                
                Toggle("Request visitor shoe photo", isOn: $requestShoePhoto)
                    .toggleStyle(SwitchToggleStyle(tint: .accentOrange))
                    .padding()
                    .background(Color.cardSandYellow)
                    .cornerRadius(10)
                
                Toggle("Log entry date and time", isOn: $logEntryTime)
                    .toggleStyle(SwitchToggleStyle(tint: .accentOrange))
                    .padding()
                    .background(Color.cardSandYellow)
                    .cornerRadius(10)
                
                Button("Create QR Entry Rules") {
                    // Placeholder for QR generation
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.buttonYellow)
                .cornerRadius(15)
            }
            .padding()
        }
        .background(Color.backgroundLightYellow)
        .navigationTitle("Visitor Control")
    }
}
