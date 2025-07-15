# Immosquare Constants

`ImmosquareConstants` is a gem that provides a collection of constants useful for real estate applications, including a comprehensive list of global locales mapped to their native language names.

## Installation

Add this line to your Gemfile:

```ruby
gem 'immosquare-constants'
```

## Usage

### IP

The IP module provides comprehensive IP address management with intelligent proxy handling and multiple output formats.

#### Get IP addresses

```ruby
# Get both local and client IP addresses
ips = ImmosquareConstants::Ip.get_ips(request)
puts "Local IP: #{ips.local}"
puts "Client IP: #{ips.client}"

# Output example:
# Local IP: 192.168.1.100
# Client IP: 203.0.113.1
```

#### Get public IP address

```ruby
# Get the public IP address of the machine
ip = ImmosquareConstants::Ip.get_my_ip_from_aws
puts ip
# => 203.0.113.1
```

#### Multiple output formats

The `get_ips` method returns an `IpResult` object with various conversion methods:

```ruby
ips = ImmosquareConstants::Ip.get_ips(request)

# JSON serialization
puts ips.to_json
# => {"local":"192.168.1.100","client":"203.0.113.1"}

# Hash conversion
hash = ips.to_hash
# => {:local=>"192.168.1.100", :client=>"203.0.113.1"}

# String representation
puts ips.to_s
# => local: 192.168.1.100, client: 203.0.113.1

# Array conversion
array = ips.to_a
# => ["192.168.1.100", "203.0.113.1"]

# Safe navigation
client_ip = ImmosquareConstants::Ip.get_ips(request)&.client
```

#### Intelligent proxy handling

The IP detection uses a smart hierarchy:
1. `HTTP_X_REAL_IP` header (often set by load balancers/proxies)
2. `request.ip` (Rails intelligent method)
3. `request.remote_ip` (direct connection IP)

This ensures accurate client IP detection even behind proxies, load balancers, or CDNs.


### Locale

To retrieve the native language name for a given locale:

```ruby
locale_name = ImmosquareConstants::Locale.native_name_for_locale(:fr)
puts locale_name
## => Français
```

Ensure you pass the locale as either a string or a symbol. If the locale isn't present in the list, it will return "Locale not found".


### Color

Convert a color name to its hexadecimal value:

```ruby
color = ImmosquareColors.color_name_to_hex("red")
puts color
## => #ff0000
```

### Regex

#### email_raw
The `email_raw` method defines the core email matching pattern used by both the `email` and `email_in_string` methods:

```ruby
regex = ImmosquareConstants::Regex.email_raw
puts regex.source
## => "[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}"
```


- `[A-Z0-9._%+-]+`: Matches one or more allowed characters in the local part of the email (before the `@`), including letters, digits, and common special characters.

- `@`: Matches the `@` symbol separating the local part from the domain.

- `[A-Z0-9.-]+`: Matches one or more allowed characters in the domain name, including letters, digits, dots, and hyphens.

- `\.`: Matches a literal dot `.` separating the domain from the extension.

- `[A-Z]{2,}`: Matches a domain extension consisting of at least two letters (e.g., `com`, `org`, `net`, `fr`).

#### email

```ruby
email = "test@test.com"
valid = ImmosquareConstants::Regex.email.match?(email)
puts "Email: #{email} is valid? => #{valid}"
## => Email: test@test.com is valid? => true
```

To validate an email format using a regular expression:

```ruby
validates_format_of :email, :with => ImmosquareConstants::Regex.email
```

---

#### Email within a string
To match an email embedded in a string:

```ruby
text   = "Contact us at test@test.com for more info or <test2@test2.fr"
emails = text.scan(ImmosquareConstants::Regex.email_in_string)
puts emails.inspect
## => ["test@test.com", "test2@test2.fr"]
```




## Contributing

Contributions are very much welcome! If you have enhancements, bug fixes, or other suggestions, please open an issue or submit a pull request on our [GitHub repository](https://github.com/immosquare/immosquare-constants).

## License

This gem is licensed under the terms of the [MIT License](https://opensource.org/licenses/MIT).
