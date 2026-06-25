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
