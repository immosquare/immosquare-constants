# Immosquare Constants

`ImmosquareConstants` is a gem that provides a collection of constants useful for real estate applications, including a comprehensive list of global locales mapped to their native language names.

## Installation

Add this line to your Gemfile:

```ruby
gem 'immosquare-constants'
```

## Usage

### IP

To get the real public IP address of the machine:

```ruby
ip = ImmosquareConstants::Ip.get_real_ip
puts "Real IP: #{ip}"
```
The IP retrieval uses Socket to fall back on a local private IP if it cannot fetch the public IP.


### Locale

To retrieve the native language name for a given locale:

```ruby
locale_name = ImmosquareConstants::Locale.native_name_for_locale(:fr)
puts locale_name  # Outputs: "Français"
```

Ensure you pass the locale as either a string or a symbol. If the locale isn't present in the list, it will return "Locale not found".


### Color

Convert a color name to its hexadecimal value:

```ruby
color = ImmosquareColors.color_name_to_hex("red")
puts color  # Outputs: #ff0000
```

### Regex

### Email
To validate an email format using a regular expression:

```ruby
validates_format_of :email, :with => ImmosquareConstants::Regex.email
```

Or manually test an email string

```ruby
email = "test@test.com"
valid = ImmosquareConstants::Regex.email.match?(email)
puts "Email: #{email} is valid? => #{valid}"
```

## Contributing

Contributions are very much welcome! If you have enhancements, bug fixes, or other suggestions, please open an issue or submit a pull request on our [GitHub repository](https://github.com/immosquare/immosquare-constants).

## License

This gem is licensed under the terms of the [MIT License](https://opensource.org/licenses/MIT).
