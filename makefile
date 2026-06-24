.PHONY: env slang icons-prod icons-stag icons clean run-prod run-stag build-prod build-stag

# Generate environment config files
env:
	fvm dart run build_runner build \
		--delete-conflicting-outputs \
		--build-filter="lib/config/env/**"

# Generate localization files
slang:
	fvm dart run slang

# Generate launcher icons for production flavor
icons-prod:
	fvm dart run flutter_launcher_icons -f flutter_launcher_icons-prod.yaml

# Generate launcher icons for staging flavor
icons-stag:
	fvm dart run flutter_launcher_icons -f flutter_launcher_icons-stag.yaml

# Generate launcher icons for all flavors
icons:
	fvm flutter pub get
	$(MAKE) icons-prod
	$(MAKE) icons-stag

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
