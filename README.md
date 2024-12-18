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
