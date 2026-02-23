import SwiftUI

struct LogsView: View {
    @AppStorage("logs") private var logsData: Data = Data()
    @State private var logs: [LogEntry] = []
    
    struct LogEntry: Codable, Identifiable {
        let id = UUID()
        let date: Date
        let index: Int
        let actions: String
        let status: String
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(logs) { log in
                    VStack(alignment: .leading) {
                        Text(log.date, style: .date)
                            .foregroundColor(.textDarkBrown)
                        Text("Index: \(log.index)")
                            .foregroundColor(.textSoftBrown)
                        Text("Actions: \(log.actions)")
                            .foregroundColor(.textSoftBrown)
                        Text("Status: \(log.status)")
                            .foregroundColor(.textSoftBrown)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.cardSandYellow)
                    .cornerRadius(10)
                }
                
                Button("Clear History") {
                    logs = []
                    saveLogs()
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.accentOrange)
                .cornerRadius(15)
            }
            .padding()
        }
        .background(Color.backgroundLightYellow)
        .navigationTitle("Logs & Reports")
        .onAppear {
            loadLogs()
        }
    }
    
    func loadLogs() {
        if let decoded = try? JSONDecoder().decode([LogEntry].self, from: logsData) {
            logs = decoded
        }
    }
    
    func saveLogs() {
        if let encoded = try? JSONEncoder().encode(logs) {
            logsData = encoded
        }
    }
}
