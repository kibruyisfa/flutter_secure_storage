// ignore_for_file: constant_identifier_names

part of '../flutter_secure_storage.dart';

/// Algorithm used to encrypt/wrap the secret key in Android KeyStore.
enum KeyCipherAlgorithm {
  /// Legacy RSA/ECB/PKCS1Padding for backwards compatibility.
  RSA_ECB_PKCS1Padding,

  /// RSA/ECB/OAEPWithSHA-256AndMGF1Padding (default, API 23+).
  RSA_ECB_OAEPwithSHA_256andMGF1Padding,

  /// AES/GCM/NoPadding for KeyStore-based key wrapping (supports biometrics).
  AES_GCM_NoPadding,
}

/// Algorithm used to encrypt stored data.
enum StorageCipherAlgorithm {
  /// ✅ REMOVED: AES_CBC_PKCS7Padding (vulnerable, not used)
  
  /// AES/GCM/NoPadding (default, API 23+).
  AES_GCM_NoPadding,
}

/// Specific options for Android platform.
class AndroidOptions extends Options {
  /// Standard secure storage using AES-GCM with RSA OAEP key wrapping.
  ///
  /// This is the default constructor with strong security:
  /// - RSA/ECB/OAEPWithSHA-256AndMGF1Padding for key protection
  /// - AES/GCM/NoPadding for data encryption
  /// - No biometric authentication required
  /// - API 23+ (Android 6.0+)
  ///
  /// For biometric authentication, use `AndroidOptions.biometric()`.
  ///
  /// Advanced users can customize cipher algorithms for specific use cases.
  /// Valid combinations:
  /// - AES_GCM_NoPadding storage + RSA key ciphers (standard RSA wrapping)
  /// - AES_GCM_NoPadding storage + AES_GCM_NoPadding key
  ///   (KeyStore-based, supports biometrics)
  const AndroidOptions({
    @Deprecated('EncryptedSharedPreferences is deprecated and will be '
        'removed in v11. The Jetpack Security library is deprecated by Google. '
        'Your data will be automatically migrated to custom ciphers on first '
        'access. Remove this parameter - it will be ignored.')
    bool encryptedSharedPreferences = false,
    bool resetOnError = true,
    bool migrateOnAlgorithmChange = true,
    bool migrateWithBackup = false,
    bool enforceBiometrics = false,
    KeyCipherAlgorithm keyCipherAlgorithm =
        KeyCipherAlgorithm.RSA_ECB_OAEPwithSHA_256andMGF1Padding,
    StorageCipherAlgorithm storageCipherAlgorithm =
        StorageCipherAlgorithm.AES_GCM_NoPadding,
    @Deprecated(
        'Use storageNamespace instead. sharedPreferencesName only isolates '
        'data storage; storageNamespace provides full isolation including '
        'KeyStore aliases and key storage.')
    this.sharedPreferencesName,
    this.preferencesKeyPrefix,
    this.storageNamespace,
    this.biometricPromptTitle,
    this.biometricPromptSubtitle,
  })  : _encryptedSharedPreferences = encryptedSharedPreferences,
        _resetOnError = resetOnError,
        _migrateOnAlgorithmChange = migrateOnAlgorithmChange,
        _migrateWithBackup = migrateWithBackup,
        _enforceBiometrics = enforceBiometrics,
        _keyCipherAlgorithm = keyCipherAlgorithm,
        _storageCipherAlgorithm = storageCipherAlgorithm;

  // ... rest of the file remains the same ...
}
