///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$app$en app = Translations$app$en._(_root);
	late final Translations$login$en login = Translations$login$en._(_root);
	late final Translations$home$en home = Translations$home$en._(_root);
	late final Translations$errors$en errors = Translations$errors$en._(_root);
}

// Path: app
class Translations$app$en {
	Translations$app$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Paper Horizon'
	String get title => 'Paper Horizon';
}

// Path: login
class Translations$login$en {
	Translations$login$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Spender — Login (Voyager)'
	String get page_title => 'Spender — Login (Voyager)';

	/// en: 'Email or Phone Number'
	String get lbl_email_or_phone => 'Email or Phone Number';

	/// en: 'e.g. priska@paper.id or 08123456789'
	String get placeholder_email_or_phone => 'e.g. priska@paper.id or 08123456789';

	/// en: 'Email or phone number is not valid'
	String get error_invalid_credential => 'Email or phone number is not valid';

	/// en: 'Log In'
	String get btn_login => 'Log In';

	/// en: 'Continue'
	String get btn_continue => 'Continue';

	/// en: 'Verify'
	String get btn_verify => 'Verify';

	/// en: 'Resend'
	String get btn_resend => 'Resend';

	/// en: 'Forgot password?'
	String get btn_forgot_password => 'Forgot password?';

	/// en: 'Enter Password'
	String get lbl_enter_password => 'Enter Password';

	/// en: 'Password'
	String get lbl_password => 'Password';

	/// en: 'Enter your password'
	String get placeholder_password => 'Enter your password';

	/// en: 'Enter your password'
	String get pwd_title => 'Enter your password';

	/// en: 'Logging in as <strong id="pwdIdentity">priska@paper.id</strong>'
	String get pwd_desc => 'Logging in as <strong id="pwdIdentity">priska@paper.id</strong>';

	/// en: 'Logging in as <span id="pwdSheetIdentity">email@example.com</span>'
	String get pwd_desc_sheet => 'Logging in as <span id="pwdSheetIdentity">email@example.com</span>';

	/// en: 'Incorrect password. Please try again.'
	String get pwd_error => 'Incorrect password. Please try again.';

	/// en: 'Enter OTP Code'
	String get otp_title => 'Enter OTP Code';

	/// en: 'We sent a 6-digit code to <strong id="otpDestination">+62 812-3456-789</strong>. Please enter it below.'
	String get otp_desc => 'We sent a 6-digit code to <strong id="otpDestination">+62 812-3456-789</strong>. Please enter it below.';

	/// en: 'Invalid OTP. Please try again.'
	String get otp_error => 'Invalid OTP. Please try again.';

	/// en: 'Didn't receive a code? '
	String get resend_prompt => 'Didn\'t receive a code? ';

	/// en: 'How would you like to verify?'
	String get verify_title => 'How would you like to verify?';

	/// en: 'Choose a verification method to continue'
	String get verify_subtitle => 'Choose a verification method to continue';

	/// en: 'Verification via SMS'
	String get method_sms => 'Verification via SMS';

	/// en: 'Receive a 6-digit code by text message'
	String get method_sms_desc => 'Receive a 6-digit code by text message';

	/// en: 'Verification via WhatsApp'
	String get method_wa => 'Verification via WhatsApp';

	/// en: 'Receive a 6-digit code on WhatsApp'
	String get method_wa_desc => 'Receive a 6-digit code on WhatsApp';

	/// en: 'Enter Password'
	String get method_pwd => 'Enter Password';

	/// en: 'Use your account password to sign in'
	String get method_pwd_desc => 'Use your account password to sign in';

	/// en: 'Verification via Email'
	String get method_email => 'Verification via Email';

	/// en: 'Receive a 6-digit code by email'
	String get method_email_desc => 'Receive a 6-digit code by email';

	/// en: 'New device detected'
	String get new_device_title => 'New device detected';

	/// en: 'Choose how you'd like to verify your identity'
	String get new_device_subtitle => 'Choose how you\'d like to verify your identity';

	/// en: 'Welcome back, <span id="successName">Priska</span>'
	String get welcome_back => 'Welcome back, <span id="successName">Priska</span>';

	/// en: 'Choose a company to continue'
	String get choose_company_subtitle => 'Choose a company to continue';
}

// Path: home
class Translations$home$en {
	Translations$home$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Flutter Demo Home Page'
	String get title => 'Flutter Demo Home Page';

	/// en: 'You have pushed the button this many times:'
	String get description => 'You have pushed the button this many times:';

	/// en: 'Increment'
	String get increment => 'Increment';
}

// Path: errors
class Translations$errors$en {
	Translations$errors$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final Translations$errors$network$en network = Translations$errors$network$en._(_root);
}

// Path: errors.network
class Translations$errors$network$en {
	Translations$errors$network$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Something went wrong. Please try again later.'
	String get unknown_error => 'Something went wrong. Please try again later.';

	/// en: 'No internet connection.'
	String get no_internet_connection => 'No internet connection.';

	/// en: 'Connection timeout.'
	String get connection_timeout => 'Connection timeout.';

	/// en: 'Receive timeout.'
	String get receive_timeout => 'Receive timeout.';

	/// en: 'Request cancelled.'
	String get request_cancelled => 'Request cancelled.';

	/// en: 'Unauthorized.'
	String get unauthorized => 'Unauthorized.';

	/// en: 'Forbidden.'
	String get forbidden => 'Forbidden.';

	/// en: 'Resource not found.'
	String get not_found => 'Resource not found.';

	/// en: 'Internal server error.'
	String get internal_server_error => 'Internal server error.';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'Paper Horizon',
			'login.page_title' => 'Spender — Login (Voyager)',
			'login.lbl_email_or_phone' => 'Email or Phone Number',
			'login.placeholder_email_or_phone' => 'e.g. priska@paper.id or 08123456789',
			'login.error_invalid_credential' => 'Email or phone number is not valid',
			'login.btn_login' => 'Log In',
			'login.btn_continue' => 'Continue',
			'login.btn_verify' => 'Verify',
			'login.btn_resend' => 'Resend',
			'login.btn_forgot_password' => 'Forgot password?',
			'login.lbl_enter_password' => 'Enter Password',
			'login.lbl_password' => 'Password',
			'login.placeholder_password' => 'Enter your password',
			'login.pwd_title' => 'Enter your password',
			'login.pwd_desc' => 'Logging in as <strong id="pwdIdentity">priska@paper.id</strong>',
			'login.pwd_desc_sheet' => 'Logging in as <span id="pwdSheetIdentity">email@example.com</span>',
			'login.pwd_error' => 'Incorrect password. Please try again.',
			'login.otp_title' => 'Enter OTP Code',
			'login.otp_desc' => 'We sent a 6-digit code to <strong id="otpDestination">+62 812-3456-789</strong>. Please enter it below.',
			'login.otp_error' => 'Invalid OTP. Please try again.',
			'login.resend_prompt' => 'Didn\'t receive a code? ',
			'login.verify_title' => 'How would you like to verify?',
			'login.verify_subtitle' => 'Choose a verification method to continue',
			'login.method_sms' => 'Verification via SMS',
			'login.method_sms_desc' => 'Receive a 6-digit code by text message',
			'login.method_wa' => 'Verification via WhatsApp',
			'login.method_wa_desc' => 'Receive a 6-digit code on WhatsApp',
			'login.method_pwd' => 'Enter Password',
			'login.method_pwd_desc' => 'Use your account password to sign in',
			'login.method_email' => 'Verification via Email',
			'login.method_email_desc' => 'Receive a 6-digit code by email',
			'login.new_device_title' => 'New device detected',
			'login.new_device_subtitle' => 'Choose how you\'d like to verify your identity',
			'login.welcome_back' => 'Welcome back, <span id="successName">Priska</span>',
			'login.choose_company_subtitle' => 'Choose a company to continue',
			'home.title' => 'Flutter Demo Home Page',
			'home.description' => 'You have pushed the button this many times:',
			'home.increment' => 'Increment',
			'errors.network.unknown_error' => 'Something went wrong. Please try again later.',
			'errors.network.no_internet_connection' => 'No internet connection.',
			'errors.network.connection_timeout' => 'Connection timeout.',
			'errors.network.receive_timeout' => 'Receive timeout.',
			'errors.network.request_cancelled' => 'Request cancelled.',
			'errors.network.unauthorized' => 'Unauthorized.',
			'errors.network.forbidden' => 'Forbidden.',
			'errors.network.not_found' => 'Resource not found.',
			'errors.network.internal_server_error' => 'Internal server error.',
			_ => null,
		};
	}
}
