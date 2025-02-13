import ArgumentParser
import CarbonLogLib

@main
struct CarbonCli: ParsableCommand {

  @Option(help: "Specify the input")
  public var input: String
  
  
  public func run() throws {
    print("Carbon says hello to \(self.input)")
  }
}
