import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static const String _tokenKey = 'user_token';
  static const String _shopNameKey = 'shop_name';
  static const String _ownerNameKey = 'owner_name';
  static const String _phoneNumberKey = 'phone_number';
  static const String _emailKey = 'email';
  static const String _addressKey = 'address';
  static const String _latitudeKey = 'latitude';
  static const String _longitudeKey = 'longitude';
  static const String _aadharNumberKey = 'aadhar_number';
  static const String _panNumberKey = 'pan_number';
  static const String _gstNumberKey = 'gst_number';
  static const String _aadharDocUrlKey = 'aadhar_doc_url';
  static const String _panDocUrlKey = 'pan_doc_url';
  static const String _gstCertificateUrlKey = 'gst_certificate_url';
  static const String _rentalAgreementUrlKey = 'rental_agreement_url';
  static const String _imageKey = 'image';

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> saveShopDetails(Map<String, dynamic> shopDetails) async {
    await setString(_shopNameKey, shopDetails['shop_name']);
    await setString(_ownerNameKey, shopDetails['owner_name']);
    await setString(_phoneNumberKey, shopDetails['phone_number']);
    await setString(_emailKey, shopDetails['email']);
    await setString(_addressKey, shopDetails['address']);
    await setString(_latitudeKey, shopDetails['latitude']);
    await setString(_longitudeKey, shopDetails['longitude']);
    await setString(_aadharNumberKey, shopDetails['aadhar_number']);
    await setString(_panNumberKey, shopDetails['pan_number']);
    await setString(_gstNumberKey, shopDetails['gst_number']);
    await setString(_aadharDocUrlKey, shopDetails['aadhar_doc_url']);
    await setString(_panDocUrlKey, shopDetails['pan_doc_url']);
    await setString(_gstCertificateUrlKey, shopDetails['gst_certificate_url']);
    await setString(_rentalAgreementUrlKey, shopDetails['rental_agreement_url']);
    await setString(_imageKey, shopDetails['image']);
  }

  Future<Map<String, String?>> getShopDetails() async {
    return {
      'shop_name': await getString(_shopNameKey),
      'owner_name': await getString(_ownerNameKey),
      'phone_number': await getString(_phoneNumberKey),
      'email': await getString(_emailKey),
      'address': await getString(_addressKey),
      'latitude': await getString(_latitudeKey),
      'longitude': await getString(_longitudeKey),
      'aadhar_number': await getString(_aadharNumberKey),
      'pan_number': await getString(_panNumberKey),
      'gst_number': await getString(_gstNumberKey),
      'aadhar_doc_url': await getString(_aadharDocUrlKey),
      'pan_doc_url': await getString(_panDocUrlKey),
      'gst_certificate_url': await getString(_gstCertificateUrlKey),
      'rental_agreement_url': await getString(_rentalAgreementUrlKey),
      'image': await getString(_imageKey),
    };
  }

  Future<void> clearShopDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_shopNameKey);
    await prefs.remove(_ownerNameKey);
    await prefs.remove(_phoneNumberKey);
    await prefs.remove(_emailKey);
    await prefs.remove(_addressKey);
    await prefs.remove(_latitudeKey);
    await prefs.remove(_longitudeKey);
    await prefs.remove(_aadharNumberKey);
    await prefs.remove(_panNumberKey);
    await prefs.remove(_gstNumberKey);
    await prefs.remove(_aadharDocUrlKey);
    await prefs.remove(_panDocUrlKey);
    await prefs.remove(_gstCertificateUrlKey);
    await prefs.remove(_rentalAgreementUrlKey);
    await prefs.remove(_imageKey);
  }
}