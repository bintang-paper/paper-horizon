.PHONY: env

# Generate environment config files
env:
	fvm dart run build_runner build \
		--delete-conflicting-outputs \
		--build-filter="lib/config/env/**"
