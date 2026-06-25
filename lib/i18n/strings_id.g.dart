///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsId with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsId({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.id,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <id>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsId _root = this; // ignore: unused_field

	@override 
	TranslationsId $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsId(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$id app = _Translations$app$id._(_root);
	@override late final _Translations$login$id login = _Translations$login$id._(_root);
	@override late final _Translations$home$id home = _Translations$home$id._(_root);
	@override late final _Translations$errors$id errors = _Translations$errors$id._(_root);
}

// Path: app
class _Translations$app$id implements Translations$app$en {
	_Translations$app$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Paper Horizon';
}

// Path: login
class _Translations$login$id implements Translations$login$en {
	_Translations$login$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get page_title => 'Spender — Masuk (Voyager)';
	@override String get lbl_email_or_phone => 'Email atau Nomor Telepon';
	@override String get placeholder_email_or_phone => 'cth. priska@paper.id atau 08123456789';
	@override String get error_invalid_credential => 'Email atau nomor telepon tidak valid';
	@override String get btn_login => 'Masuk';
	@override String get btn_continue => 'Lanjutkan';
	@override String get btn_verify => 'Verifikasi';
	@override String get btn_resend => 'Kirim Ulang';
	@override String get btn_forgot_password => 'Lupa kata sandi?';
	@override String get lbl_enter_password => 'Masukkan Kata Sandi';
	@override String get lbl_password => 'Kata Sandi';
	@override String get placeholder_password => 'Masukkan kata sandi Anda';
	@override String get pwd_title => 'Masukkan kata sandi Anda';
	@override String get pwd_desc => 'Masuk sebagai <strong id="pwdIdentity">priska@paper.id</strong>';
	@override String get pwd_desc_sheet => 'Masuk sebagai <span id="pwdSheetIdentity">email@example.com</span>';
	@override String get pwd_error => 'Kata sandi salah. Silakan coba lagi.';
	@override String get otp_title => 'Masukkan Kode OTP';
	@override String get otp_desc => 'Kami telah mengirim kode 6 digit ke <strong id="otpDestination">+62 812-3456-789</strong>. Silakan masukkan di bawah.';
	@override String get otp_error => 'OTP tidak valid. Silakan coba lagi.';
	@override String get resend_prompt => 'Tidak menerima kode? ';
	@override String get verify_title => 'Bagaimana Anda ingin memverifikasi?';
	@override String get verify_subtitle => 'Pilih metode verifikasi untuk melanjutkan';
	@override String get method_sms => 'Verifikasi via SMS';
	@override String get method_sms_desc => 'Terima kode 6 digit melalui pesan teks';
	@override String get method_wa => 'Verifikasi via WhatsApp';
	@override String get method_wa_desc => 'Terima kode 6 digit di WhatsApp';
	@override String get method_pwd => 'Masukkan Kata Sandi';
	@override String get method_pwd_desc => 'Gunakan kata sandi akun Anda untuk masuk';
	@override String get method_email => 'Verifikasi via Email';
	@override String get method_email_desc => 'Terima kode 6 digit melalui email';
	@override String get new_device_title => 'Perangkat baru terdeteksi';
	@override String get new_device_subtitle => 'Pilih cara verifikasi identitas Anda';
	@override String get welcome_back => 'Selamat datang kembali, <span id="successName">Priska</span>';
	@override String get choose_company_subtitle => 'Pilih perusahaan untuk melanjutkan';
}

// Path: home
class _Translations$home$id implements Translations$home$en {
	_Translations$home$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get title => 'Halaman Beranda Flutter Demo';
	@override String get description => 'Anda telah menekan tombol sebanyak:';
	@override String get increment => 'Tambah';
}

// Path: errors
class _Translations$errors$id implements Translations$errors$en {
	_Translations$errors$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override late final _Translations$errors$network$id network = _Translations$errors$network$id._(_root);
}

// Path: errors.network
class _Translations$errors$network$id implements Translations$errors$network$en {
	_Translations$errors$network$id._(this._root);

	final TranslationsId _root; // ignore: unused_field

	// Translations
	@override String get unknown_error => 'Terjadi kesalahan. Silakan coba lagi nanti.';
	@override String get no_internet_connection => 'Tidak ada koneksi internet.';
	@override String get connection_timeout => 'Waktu koneksi habis.';
	@override String get receive_timeout => 'Waktu terima habis.';
	@override String get request_cancelled => 'Permintaan dibatalkan.';
	@override String get unauthorized => 'Tidak diotorisasi.';
	@override String get forbidden => 'Terlarang.';
	@override String get not_found => 'Sumber tidak ditemukan.';
	@override String get internal_server_error => 'Kesalahan server internal.';
}

/// The flat map containing all translations for locale <id>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsId {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'Paper Horizon',
			'login.page_title' => 'Spender — Masuk (Voyager)',
			'login.lbl_email_or_phone' => 'Email atau Nomor Telepon',
			'login.placeholder_email_or_phone' => 'cth. priska@paper.id atau 08123456789',
			'login.error_invalid_credential' => 'Email atau nomor telepon tidak valid',
			'login.btn_login' => 'Masuk',
			'login.btn_continue' => 'Lanjutkan',
			'login.btn_verify' => 'Verifikasi',
			'login.btn_resend' => 'Kirim Ulang',
			'login.btn_forgot_password' => 'Lupa kata sandi?',
			'login.lbl_enter_password' => 'Masukkan Kata Sandi',
			'login.lbl_password' => 'Kata Sandi',
			'login.placeholder_password' => 'Masukkan kata sandi Anda',
			'login.pwd_title' => 'Masukkan kata sandi Anda',
			'login.pwd_desc' => 'Masuk sebagai <strong id="pwdIdentity">priska@paper.id</strong>',
			'login.pwd_desc_sheet' => 'Masuk sebagai <span id="pwdSheetIdentity">email@example.com</span>',
			'login.pwd_error' => 'Kata sandi salah. Silakan coba lagi.',
			'login.otp_title' => 'Masukkan Kode OTP',
			'login.otp_desc' => 'Kami telah mengirim kode 6 digit ke <strong id="otpDestination">+62 812-3456-789</strong>. Silakan masukkan di bawah.',
			'login.otp_error' => 'OTP tidak valid. Silakan coba lagi.',
			'login.resend_prompt' => 'Tidak menerima kode? ',
			'login.verify_title' => 'Bagaimana Anda ingin memverifikasi?',
			'login.verify_subtitle' => 'Pilih metode verifikasi untuk melanjutkan',
			'login.method_sms' => 'Verifikasi via SMS',
			'login.method_sms_desc' => 'Terima kode 6 digit melalui pesan teks',
			'login.method_wa' => 'Verifikasi via WhatsApp',
			'login.method_wa_desc' => 'Terima kode 6 digit di WhatsApp',
			'login.method_pwd' => 'Masukkan Kata Sandi',
			'login.method_pwd_desc' => 'Gunakan kata sandi akun Anda untuk masuk',
			'login.method_email' => 'Verifikasi via Email',
			'login.method_email_desc' => 'Terima kode 6 digit melalui email',
			'login.new_device_title' => 'Perangkat baru terdeteksi',
			'login.new_device_subtitle' => 'Pilih cara verifikasi identitas Anda',
			'login.welcome_back' => 'Selamat datang kembali, <span id="successName">Priska</span>',
			'login.choose_company_subtitle' => 'Pilih perusahaan untuk melanjutkan',
			'home.title' => 'Halaman Beranda Flutter Demo',
			'home.description' => 'Anda telah menekan tombol sebanyak:',
			'home.increment' => 'Tambah',
			'errors.network.unknown_error' => 'Terjadi kesalahan. Silakan coba lagi nanti.',
			'errors.network.no_internet_connection' => 'Tidak ada koneksi internet.',
			'errors.network.connection_timeout' => 'Waktu koneksi habis.',
			'errors.network.receive_timeout' => 'Waktu terima habis.',
			'errors.network.request_cancelled' => 'Permintaan dibatalkan.',
			'errors.network.unauthorized' => 'Tidak diotorisasi.',
			'errors.network.forbidden' => 'Terlarang.',
			'errors.network.not_found' => 'Sumber tidak ditemukan.',
			'errors.network.internal_server_error' => 'Kesalahan server internal.',
			_ => null,
		};
	}
}
