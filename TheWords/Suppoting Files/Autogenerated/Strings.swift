// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  internal enum Authorization {
    /// Localizable.strings
    ///   TheWords
    /// 
    ///   Created by Louise on 13/11/23.
    internal static let player1 = L10n.tr("Localizable", "Authorization.player1", fallback: "Player 1")
    /// Player 2
    internal static let player2 = L10n.tr("Localizable", "Authorization.player2", fallback: "Player 2")
    /// Start
    internal static let start = L10n.tr("Localizable", "Authorization.start", fallback: "Start")
    /// Enter a long word
    internal static let word = L10n.tr("Localizable", "Authorization.word", fallback: "Enter a long word")
  }
  internal enum Error {
    /// This word was used!
    internal static let beforeWord = L10n.tr("Localizable", "Error.beforeWord", fallback: "This word was used!")
    /// This word is short!
    internal static let shortWord = L10n.tr("Localizable", "Error.shortWord", fallback: "This word is short!")
    /// This word was main!
    internal static let theSameWord = L10n.tr("Localizable", "Error.theSameWord", fallback: "This word was main!")
    /// Undefined error!
    internal static let undefined = L10n.tr("Localizable", "Error.undefined", fallback: "Undefined error!")
    /// This word is wrong!
    internal static let wrongWord = L10n.tr("Localizable", "Error.wrongWord", fallback: "This word is wrong!")
  }
  internal enum Game {
    /// Done!
    internal static let done = L10n.tr("Localizable", "Game.done", fallback: "Done!")
    /// Exit
    internal static let exit = L10n.tr("Localizable", "Game.exit", fallback: "Exit")
    /// Are you sure you want to end the game?
    internal static let exitConfirmation = L10n.tr("Localizable", "Game.exitConfirmation", fallback: "Are you sure you want to end the game?")
    /// Cancel
    internal static let exitConfirmationCancel = L10n.tr("Localizable", "Game.exitConfirmationCancel", fallback: "Cancel")
    /// Yes
    internal static let exitConfirmationYes = L10n.tr("Localizable", "Game.exitConfirmationYes", fallback: "Yes")
    /// Your word...
    internal static let yourWord = L10n.tr("Localizable", "Game.yourWord", fallback: "Your word...")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
