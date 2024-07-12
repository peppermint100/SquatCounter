//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import RswiftResources

private class BundleFinder {}
let R = _R(bundle: Bundle(for: BundleFinder.self))

struct _R {
  let bundle: Foundation.Bundle
  var string: string { .init(bundle: bundle, preferredLanguages: nil, locale: nil) }
  var color: color { .init(bundle: bundle) }

  func string(bundle: Foundation.Bundle) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: nil)
  }
  func string(locale: Foundation.Locale) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: locale)
  }
  func string(preferredLanguages: [String], locale: Locale? = nil) -> string {
    .init(bundle: bundle, preferredLanguages: preferredLanguages, locale: locale)
  }
  func color(bundle: Foundation.Bundle) -> color {
    .init(bundle: bundle)
  }
  func validate() throws {

  }

  struct project {
    let developmentRegion = "en"
  }

  /// This `_R.string` struct is generated, and contains static references to 2 localization tables.
  struct string {
    let bundle: Foundation.Bundle
    let preferredLanguages: [String]?
    let locale: Locale?
    var infoPlist: infoPlist { .init(source: .init(bundle: bundle, tableName: "InfoPlist", preferredLanguages: preferredLanguages, locale: locale)) }
    var localizable: localizable { .init(source: .init(bundle: bundle, tableName: "Localizable", preferredLanguages: preferredLanguages, locale: locale)) }

    func infoPlist(preferredLanguages: [String]) -> infoPlist {
      .init(source: .init(bundle: bundle, tableName: "InfoPlist", preferredLanguages: preferredLanguages, locale: locale))
    }
    func localizable(preferredLanguages: [String]) -> localizable {
      .init(source: .init(bundle: bundle, tableName: "Localizable", preferredLanguages: preferredLanguages, locale: locale))
    }


    /// This `_R.string.infoPlist` struct is generated, and contains static references to 2 localization keys.
    struct infoPlist {
      let source: RswiftResources.StringResource.Source

      /// en translation: Bluetooth permission is required for exercising with AirPods.
      ///
      /// Key: NSBluetoothAlwaysUsageDescription
      ///
      /// Locales: en, ko
      var nsBluetoothAlwaysUsageDescription: RswiftResources.StringResource { .init(key: "NSBluetoothAlwaysUsageDescription", tableName: "InfoPlist", source: source, developmentValue: "Bluetooth permission is required for exercising with AirPods.", comment: nil) }

      /// en translation: Permission is required to measure exercise using the motion sensor of the iPhone or AirPods.
      ///
      /// Key: NSMotionUsageDescription
      ///
      /// Locales: en, ko
      var nsMotionUsageDescription: RswiftResources.StringResource { .init(key: "NSMotionUsageDescription", tableName: "InfoPlist", source: source, developmentValue: "Permission is required to measure exercise using the motion sensor of the iPhone or AirPods.", comment: nil) }
    }

    /// This `_R.string.localizable` struct is generated, and contains static references to 20 localization keys.
    struct localizable {
      let source: RswiftResources.StringResource.Source

      /// en translation: AirPods
      ///
      /// Key: AirPods
      ///
      /// Locales: en, ko
      var airPods: RswiftResources.StringResource { .init(key: "AirPods", tableName: "Localizable", source: source, developmentValue: "AirPods", comment: nil) }

      /// en translation: Please wear both AirPods during your workout.
      ///
      /// Key: AirpodsMotionSensorDescription
      ///
      /// Locales: en, ko
      var airpodsMotionSensorDescription: RswiftResources.StringResource { .init(key: "AirpodsMotionSensorDescription", tableName: "Localizable", source: source, developmentValue: "Please wear both AirPods during your workout.", comment: nil) }

      /// en translation: AirPods Motion Sensor
      ///
      /// Key: AirpodsMotionSensorHeadline
      ///
      /// Locales: en, ko
      var airpodsMotionSensorHeadline: RswiftResources.StringResource { .init(key: "AirpodsMotionSensorHeadline", tableName: "Localizable", source: source, developmentValue: "AirPods Motion Sensor", comment: nil) }

      /// en translation: Bluetooth
      ///
      /// Key: Bluetooth
      ///
      /// Locales: en, ko
      var bluetooth: RswiftResources.StringResource { .init(key: "Bluetooth", tableName: "Localizable", source: source, developmentValue: "Bluetooth", comment: nil) }

      /// en translation: Bluetooth permission is required for exercising with AirPods.
      ///
      /// Key: Bluetooth Permission Description
      ///
      /// Locales: en, ko
      var bluetoothPermissionDescription: RswiftResources.StringResource { .init(key: "Bluetooth Permission Description", tableName: "Localizable", source: source, developmentValue: "Bluetooth permission is required for exercising with AirPods.", comment: nil) }

      /// en translation: Choose Your Device
      ///
      /// Key: Choose Your Device
      ///
      /// Locales: en, ko
      var chooseYourDevice: RswiftResources.StringResource { .init(key: "Choose Your Device", tableName: "Localizable", source: source, developmentValue: "Choose Your Device", comment: nil) }

      /// en translation: Home
      ///
      /// Key: Home
      ///
      /// Locales: en, ko
      var home: RswiftResources.StringResource { .init(key: "Home", tableName: "Localizable", source: source, developmentValue: "Home", comment: nil) }

      /// en translation: Motion Sensor
      ///
      /// Key: Motion Sensor
      ///
      /// Locales: en, ko
      var motionSensor: RswiftResources.StringResource { .init(key: "Motion Sensor", tableName: "Localizable", source: source, developmentValue: "Motion Sensor", comment: nil) }

      /// en translation: Permission is required to measure exercise using the motion sensor of the iPhone or AirPods.
      ///
      /// Key: Motion Sensor Description
      ///
      /// Locales: en, ko
      var motionSensorDescription: RswiftResources.StringResource { .init(key: "Motion Sensor Description", tableName: "Localizable", source: source, developmentValue: "Permission is required to measure exercise using the motion sensor of the iPhone or AirPods.", comment: nil) }

      /// en translation: Motion and fitness permissions are required to count squats.
      ///
      /// Key: MotionFitnessPermissionDescription
      ///
      /// Locales: en, ko
      var motionFitnessPermissionDescription: RswiftResources.StringResource { .init(key: "MotionFitnessPermissionDescription", tableName: "Localizable", source: source, developmentValue: "Motion and fitness permissions are required to count squats.", comment: nil) }

      /// en translation: Motion & Fitness Permission Required
      ///
      /// Key: MotionFitnessPermissionHeadline
      ///
      /// Locales: en, ko
      var motionFitnessPermissionHeadline: RswiftResources.StringResource { .init(key: "MotionFitnessPermissionHeadline", tableName: "Localizable", source: source, developmentValue: "Motion & Fitness Permission Required", comment: nil) }

      /// en translation: Next
      ///
      /// Key: Next
      ///
      /// Locales: en, ko
      var next: RswiftResources.StringResource { .init(key: "Next", tableName: "Localizable", source: source, developmentValue: "Next", comment: nil) }

      /// en translation: No AirPods Connected
      ///
      /// Key: No AirPods Connected
      ///
      /// Locales: en, ko
      var noAirPodsConnected: RswiftResources.StringResource { .init(key: "No AirPods Connected", tableName: "Localizable", source: source, developmentValue: "No AirPods Connected", comment: nil) }

      /// en translation: Please allow the following permissions to use the app.
      ///
      /// Key: Onboarding Permission Title
      ///
      /// Locales: en, ko
      var onboardingPermissionTitle: RswiftResources.StringResource { .init(key: "Onboarding Permission Title", tableName: "Localizable", source: source, developmentValue: "Please allow the following permissions to use the app.", comment: nil) }

      /// en translation: Set Goal
      ///
      /// Key: Set Goal
      ///
      /// Locales: en, ko
      var setGoal: RswiftResources.StringResource { .init(key: "Set Goal", tableName: "Localizable", source: source, developmentValue: "Set Goal", comment: nil) }

      /// en translation: Setting
      ///
      /// Key: Setting
      ///
      /// Locales: en, ko
      var setting: RswiftResources.StringResource { .init(key: "Setting", tableName: "Localizable", source: source, developmentValue: "Setting", comment: nil) }

      /// en translation: Start
      ///
      /// Key: Start
      ///
      /// Locales: en, ko
      var start: RswiftResources.StringResource { .init(key: "Start", tableName: "Localizable", source: source, developmentValue: "Start", comment: nil) }

      /// en translation: iPhone
      ///
      /// Key: iPhone
      ///
      /// Locales: en, ko
      var iPhone: RswiftResources.StringResource { .init(key: "iPhone", tableName: "Localizable", source: source, developmentValue: "iPhone", comment: nil) }

      /// en translation: Please hold your iPhone properly during your workout.
      ///
      /// Key: iPhoneMotionSensorDescription
      ///
      /// Locales: en, ko
      var iPhoneMotionSensorDescription: RswiftResources.StringResource { .init(key: "iPhoneMotionSensorDescription", tableName: "Localizable", source: source, developmentValue: "Please hold your iPhone properly during your workout.", comment: nil) }

      /// en translation: iPhone Motion Sensor
      ///
      /// Key: iPhoneMotionSensorHeadline
      ///
      /// Locales: en, ko
      var iPhoneMotionSensorHeadline: RswiftResources.StringResource { .init(key: "iPhoneMotionSensorHeadline", tableName: "Localizable", source: source, developmentValue: "iPhone Motion Sensor", comment: nil) }
    }
  }

  /// This `_R.color` struct is generated, and contains static references to 4 colors.
  struct color {
    let bundle: Foundation.Bundle

    /// Color `AccentColor`.
    var accentColor: RswiftResources.ColorResource { .init(name: "AccentColor", path: [], bundle: bundle) }

    /// Color `backgroundColor`.
    var backgroundColor: RswiftResources.ColorResource { .init(name: "backgroundColor", path: [], bundle: bundle) }

    /// Color `descriptionLabel`.
    var descriptionLabel: RswiftResources.ColorResource { .init(name: "descriptionLabel", path: [], bundle: bundle) }

    /// Color `lightGray`.
    var lightGray: RswiftResources.ColorResource { .init(name: "lightGray", path: [], bundle: bundle) }
  }
}