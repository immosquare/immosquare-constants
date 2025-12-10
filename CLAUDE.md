# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ImmosquareConstants is a Ruby gem providing utility constants and helpers for real estate applications. It includes modules for IP detection, locale names, color conversion, and email regex validation.

## Development Commands

```bash
# Install dependencies
bundle install

# Run all tests
bundle exec rspec

# Run tests with detailed output
bundle exec rspec --format documentation

# Run a single test file
bundle exec rspec spec/lib/immosquare-constants/ip_spec.rb

# Run tests via Rake
bundle exec rake spec

# Sample rake tasks to test functionality
bundle exec rake immosquare_constants:sample:ip:get_my_ip_from_aws
bundle exec rake immosquare_constants:sample:color:color_name_to_hex
bundle exec rake immosquare_constants:sample:locale:native_name_for_locale
```

## Architecture

The gem is organized under the `ImmosquareConstants` module with four submodules:

- **Ip** (`lib/immosquare-constants/ip.rb`): IP address detection (local, public, client). Returns `IpResult` objects with dot notation access and multiple output formats (JSON, hash, array). Uses AWS checkip for public IP and intelligent proxy handling for client IP.

- **Locale** (`lib/immosquare-constants/locale.rb`): Maps locale codes to native language names via `LOCALES` constant. Supports both base locales (`:fr`) and regional variants (`:"fr-CA"`).

- **Color** (`lib/immosquare-constants/color.rb`): Maps CSS color names to hex values via `COLORS` constant. Case-insensitive lookup.

- **Regex** (`lib/immosquare-constants/regex.rb`): Email validation patterns. Three methods: `email_raw` (base pattern), `email` (full string validation), `email_in_string` (extraction from text).

## Requirements

- Ruby >= 3.2.6
