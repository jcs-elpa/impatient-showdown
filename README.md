[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![MELPA](https://melpa.org/packages/impatient-showdown-badge.svg)](https://melpa.org/#/impatient-showdown)
[![MELPA Stable](https://stable.melpa.org/packages/impatient-showdown-badge.svg)](https://stable.melpa.org/#/impatient-showdown)

# impatient-showdown
> Preview markdown buffer live over HTTP using showdown.

[![CI](https://github.com/jcs-elpa/impatient-showdown/actions/workflows/test.yml/badge.svg)](https://github.com/jcs-elpa/impatient-showdown/actions/workflows/test.yml)

<p align="center">
  <img src="./etc/screenshot.png" width="733" height="364"/>
</p>

Use [impatient-mode](https://github.com/skeeto/impatient-mode) with
[showdown](https://github.com/showdownjs/showdown) to preview Markdown over HTTP
for real time editing Markdown file.

[showdown](https://github.com/showdownjs/showdown)
is a great tool that converts Markdown to HTML with different kind of
flavor; including GitHub style markdown.

## 🔧 Usage

Use this package by calling the command below. Then it should opens your markdown
file in browser.

```
M-x impatient-showdown-mode
```

## 🔧 Customization

#### 🧪 Variables

- `impatient-showdown-preview-template` - main preview HTML template file (not encouraged)

> ⚠️ Following variables only work when preview template is using the default template!

- `impatient-showdown-scripts` - List of JavaScript to load.
- `impatient-showdown-links` - List of CSS to load.
- `impatient-showdown-flavor` - markdown flavor (default to` 'original`)
- `impatient-showdown-background-color` - `<body>` background color (default to `"#141414"`)
- `impatient-showdown-markdown-background-color` - markdown background color (default to `"#888888"`)
- `impatient-showdown-markdown-border-color` - markdown border color (default to `"#AAAAAA"`)

## Contribute

[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)
[![Elisp styleguide](https://img.shields.io/badge/elisp-style%20guide-purple)](https://github.com/bbatsov/emacs-lisp-style-guide)
[![Donate on paypal](https://img.shields.io/badge/paypal-donate-1?logo=paypal&color=blue)](https://www.paypal.me/jcs090218)
[![Become a patron](https://img.shields.io/badge/patreon-become%20a%20patron-orange.svg?logo=patreon)](https://www.patreon.com/jcs090218)

If you would like to contribute to this project, you may either clone and make pull
requests to this repository. Or you can clone the project and establish your own
branch of this tool. Any methods are welcome!
