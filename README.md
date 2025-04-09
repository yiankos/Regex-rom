# Greek Text Parser (B4J)

A B4J desktop utility for parsing structured data from Greek text entries. This tool extracts meaningful information such as full names, parental details, birth dates, birthplaces, residence locations, and other regional attributes from raw, variably formatted Greek text.

## ✨ Features

- Extracts:
  - Entry number
  - Surname (supports multi-word, hyphenated, or alternate forms)
  - Given name(s)
  - Father's and mother's names (including optional alternates)
  - Date of birth (supports full date or year-only formats)
  - Birthplace (if present)
  - Place of residence
  - Area or district (supports both `θέση` and `περιοχή`)
  - Optional description field (if enclosed in parentheses)

- Supports:
  - Variations in Greek phrasing such as `γεν.`, `στην`, `κατ.`, `ή`, etc.
  - Incomplete or abbreviated entries
  - Flexible and resilient regex-based parsing engine

## 🛠 Built With

- [B4J](https://www.b4x.com/b4j.html) – Simple and powerful cross-platform Java tool by Anywhere Software

## 📂 Usage

Paste or load Greek text entries into the tool and view extracted structured data instantly. Ideal for converting unstructured documents into tabular or database-ready format. XML export available.

## 📄 License

MIT License – feel free to use, extend, and contribute.
