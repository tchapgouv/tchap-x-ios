// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum TchapL10n {
  /// Frequently Asked Questions
  internal static var commonFaq: String { return TchapL10n.tr("TchapLocalizable", "common_faq") }
  /// Legals
  internal static var commonLegal: String { return TchapL10n.tr("TchapLocalizable", "common_legal") }
  /// EXTERNAL GUEST
  internal static var commonUserIsExternal: String { return TchapL10n.tr("TchapLocalizable", "common_user_is_external") }
  /// Privacy policy
  internal static var legalPrivacyPolicy: String { return TchapL10n.tr("TchapLocalizable", "legal_privacy_policy") }
  /// Terms of use
  internal static var legalTermsOfUse: String { return TchapL10n.tr("TchapLocalizable", "legal_terms_of_use") }
  /// EXTERNALS
  internal static var roomHeaderBadgeAuthorizedToExternal: String { return TchapL10n.tr("TchapLocalizable", "room_header_badge_authorized_to_external") }
  /// ENCRYPTED
  internal static var roomHeaderBadgeEncrypted: String { return TchapL10n.tr("TchapLocalizable", "room_header_badge_encrypted") }
  /// NOT ENCRYPTED
  internal static var roomHeaderBadgeNotEncrypted: String { return TchapL10n.tr("TchapLocalizable", "room_header_badge_not_encrypted") }
  /// PUBLIC
  internal static var roomHeaderBadgePublic: String { return TchapL10n.tr("TchapLocalizable", "room_header_badge_public") }
  /// More info
  internal static var screenCreateRoomExternalsArePresentsLink: String { return TchapL10n.tr("TchapLocalizable", "screen_create_room_externals_are_presents_link") }
  /// This room contains external members.
  internal static var screenCreateRoomExternalsArePresentsWarning: String { return TchapL10n.tr("TchapLocalizable", "screen_create_room_externals_are_presents_warning") }
  /// - End-to-end encrypted
  /// - Only people invited can access this room
  /// - Advised up to 500 members
  internal static var screenCreateRoomPrivateEncryptedOptionDescription: String { return TchapL10n.tr("TchapLocalizable", "screen_create_room_private_encrypted_option_description") }
  /// Private secured room
  internal static var screenCreateRoomPrivateEncryptedOptionTitle: String { return TchapL10n.tr("TchapLocalizable", "screen_create_room_private_encrypted_option_title") }
  /// - Not end-to-end encrypted
  /// - Only people invited can access this room
  internal static var screenCreateRoomPrivateOptionDescription: String { return TchapL10n.tr("TchapLocalizable", "screen_create_room_private_option_description") }
  /// Private room
  internal static var screenCreateRoomPrivateOptionTitle: String { return TchapL10n.tr("TchapLocalizable", "screen_create_room_private_option_title") }
  /// • Not end-to-end encrypted
  /// • Visible in the list of rooms
  /// 
  internal static var screenCreateRoomPublicOptionDescription1: String { return TchapL10n.tr("TchapLocalizable", "screen_create_room_public_option_description_1") }
  /// • Not allwed to external guests
  internal static var screenCreateRoomPublicOptionDescription2: String { return TchapL10n.tr("TchapLocalizable", "screen_create_room_public_option_description_2") }
  /// Public room
  internal static var screenCreateRoomPublicOptionTitle: String { return TchapL10n.tr("TchapLocalizable", "screen_create_room_public_option_title") }
  /// Visible only to members of "%1$@"
  internal static func screenCreateRoomPublicOptionUnfederatedDescription(_ p1: Any) -> String {
    return TchapL10n.tr("TchapLocalizable", "screen_create_room_public_option_unfederated_description", String(describing: p1))
  }
  /// Limited to my domain
  internal static var screenCreateRoomPublicOptionUnfederatedTitle: String { return TchapL10n.tr("TchapLocalizable", "screen_create_room_public_option_unfederated_title") }
  /// Room type
  internal static var screenCreateRoomRoomVisibilitySectionTitle: String { return TchapL10n.tr("TchapLocalizable", "screen_create_room_room_visibility_section_title") }
  /// Members
  internal static var screenCreateRoomSelectedUsersLabel: String { return TchapL10n.tr("TchapLocalizable", "screen_create_room_selected_users_label") }
  /// Join a public room
  internal static var screenRoomDirectorySearchTitle: String { return TchapL10n.tr("TchapLocalizable", "screen_room_directory_search_title") }
  /// Join a public room
  internal static var startChatActionJoinForum: String { return TchapL10n.tr("TchapLocalizable", "start_chat_action_join_forum") }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension TchapL10n {
  static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // Use preferredLocalizations to get a language that is in the bundle and the user's preferred list of languages.
    let languages = Bundle.overrideLocalizations ?? Bundle.app.preferredLocalizations

    for language in languages {
      if let translation = trIn(language, table, key, args) {
        return translation
      }
    }
    return Bundle.app.developmentLocalization.flatMap { trIn($0, table, key, args) } ?? key
  }

  private static func trIn(_ language: String, _ table: String, _ key: String, _ args: CVarArg...) -> String? {
    guard let bundle = Bundle.lprojBundle(for: language) else { return nil }
    let format = NSLocalizedString(key, tableName: table, bundle: bundle, comment: "")
    let translation = String(format: format, locale: Locale(identifier: language), arguments: args)
    guard translation != key, 
          translation != "\(key) \(key)" // Handle double pseudo for tests
      else { 
        return nil 
      }
    return translation
  }
}

// swiftlint:enable all
