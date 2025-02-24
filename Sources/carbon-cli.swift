import ArgumentParser
import CarbonLogLib
import Foundation

@main
@available(macOS 12, *)
struct CarbonCli: AsyncParsableCommand {
    @Argument(
        help: "A file containing a CSV formatted Carbon Log",
        completion: .file(), transform: URL.init(fileURLWithPath:)
    )
    var inputFile: URL

    @Flag(name: .shortAndLong)
    var verbose = false

    mutating func run() async throws {
        if verbose {
            print("processing file \(inputFile)")
        }

        let csvService = LocalStringFilePersistenceService(fileURL: inputFile, format: .CSV)
        let log = await csvService.load(id: "String")

        if let log {
            print("file contains \(log.measurements.count) measurement(s)\n")
            print(log.measurements.reduce("") { $0 + $1.description + "\n" })
        } else {
            throw ValidationError("could not parse log")
        }
    }
}
