# CLAUDE.md

## Overview

Gem Ruby (>= 3.2.6) fournissant des constantes et helpers : détection IP, noms de locales, couleurs CSS, regex email.

## Commands

```bash
bundle install          # Install dependencies
bundle exec rspec       # Run tests
```

## Architecture

Module `ImmosquareConstants` avec 4 sous-modules :

| Module | Fichier | Description |
|--------|---------|-------------|
| **Ip** | `lib/immosquare-constants/ip.rb` | Détection IP (local, public, client). Retourne `IpResult` avec formats JSON/hash/array. |
| **Locale** | `lib/immosquare-constants/locale.rb` | Mapping codes locales → noms natifs (`:fr`, `:"fr-CA"`). Constante `LOCALES`. |
| **Color** | `lib/immosquare-constants/color.rb` | Mapping noms CSS → hex. Constante `COLORS`, lookup case-insensitive. |
| **Regex** | `lib/immosquare-constants/regex.rb` | Validation email : `email_raw`, `email`, `email_in_string`. |
