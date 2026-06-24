.PHONY: env slang clean run-prod run-stag build-prod build-stag

# Generate environment config files
env:
	fvm dart run build_runner build \
		--delete-conflicting-outputs \
		--build-filter="lib/config/env/**"

# Generate localization files
slang:
	fvm dart run slang

# Clean build artifacts
clean:
	fvm flutter clean

# Run staging flavor
run-stag:
	fvm flutter run -t lib/main_stag.dart --flavor stag

# Run production flavor
run-prod:
	fvm flutter run -t lib/main_prod.dart --flavor prod

# Build staging APK
build-stag-apk:
	fvm flutter build apk -t lib/main_stag.dart --flavor stag

# Build production APK
build-prod-apk:
	fvm flutter build apk -t lib/main_prod.dart --flavor prod

# Build staging iOS
build-stag-ios:
	fvm flutter build ios -t lib/main_stag.dart --flavor stag

# Build production iOS
build-prod-ios:
	fvm flutter build ios -t lib/main_prod.dart --flavor prod
