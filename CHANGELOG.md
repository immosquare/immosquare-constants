## [0.1.16] - 2025-10-06
- disable ssl verification to avoid SSL_connect returned=1 errno=0

## [0.1.15] - 2025-07-16
- **BREAKING**: add `.each` and `.each_with_index` to `IpResult` class

## [0.1.14] - 2025-01-XX
- **NEW**: Add public IP support to `IpResult` class
- **IMPROVED**: `IpResult` now includes local, public, and client IPs
- **IMPROVED**: All conversion methods updated to include public IP (`to_json`, `to_hash`, `to_s`, `to_a`, `inspect`)
- **IMPROVED**: Enhanced test coverage for all IP types
- **IMPROVED**: Updated README with comprehensive IP functionality examples
- **FIXED**: Constructor now properly accepts 3 parameters (local, public, client)

## [0.1.13] - 2025-07-15
- **BREAKING**: Rename `get_real_ip` to `get_my_ip_from_aws` for better clarity
- **NEW**: Add `IpResult` class with multiple output formats (`to_json`, `to_hash`, `to_s`, `to_a`, `inspect`)
- **IMPROVED**: Enhanced IP detection with intelligent proxy handling
- **IMPROVED**: Better error handling and fallback mechanisms
- **IMPROVED**: Support for safe navigation operator (`&.client`, `&.local`)
- **FIXED**: Resolve Ruby 3.5+ compatibility issues with OpenStruct

## [0.1.12] - 2025-07-14
- Add new method get_ips
- Deprecate get_real_ip

## [0.1.11] - 2025-04-14
- Add new locale : es-LA

## [0.1.10] - 2024-11-12
- add new method languages_with_native_names

## [0.1.9] - 2024-11-10
- update method to manage country specifications

## [0.1.8] - 2024-10-11
- Add new regex : email_raw

## [0.1.7] - 2024-10-10
- Add new regex : email_in_string

## [0.1.6] - 2024-10-10
- Improve email regex

## [0.1.5] - 2024-09-08
- App ip Module

## [0.1.4] - 2023-10-06
- Add Regex Module

## [0.1.3] - 2023-10-06
- Fix module

## [0.1.2] - 2023-10-06
- Add missing require

## [0.1.1] - 2023-10-06
- Add Color Module

## [0.1.0] - 2023-10-06
- Initial release
