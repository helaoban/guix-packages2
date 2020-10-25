(use-modules (guix packages) (guix download)
             (guix build-system haskell)
             (guix licenses)
             (gnu packages haskell-xyz)
             (gnu packages haskell-check)
             (gnu packages haskell-web)
             (gnu packages haskell-crypto))

(define-public ghc-doctest
  (package
    (name "ghc-doctest")
    (version "0.16.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://hackage.haskell.org/package/doctest/doctest-"
             version
             ".tar.gz"))
       (sha256
        (base32 
          "1y1l7aa80qkib1z8lsizgg7fpfdmdwhxvi5m255a42jdkjgn5sfg"))))
    (build-system haskell-build-system)
    (arguments `(#:tests? #f))          ; FIXME: missing test framework
    (inputs
     `(("ghc-syb" ,ghc-syb)
       ("ghc-paths" ,ghc-paths)
       ("ghc-base-compat" ,ghc-base-compat)
       ("ghc-code-page" ,ghc-code-page)
       ("ghc-hunit" ,ghc-hunit)
       ("ghc-hspec" ,ghc-hspec)
       ("ghc-quickcheck" ,ghc-quickcheck)
       ("ghc-stringbuilder" ,ghc-stringbuilder)
       ("ghc-silently" ,ghc-silently)
       ("ghc-setenv" ,ghc-setenv)))
    (home-page
     "https://github.com/sol/doctest#readme")
    (synopsis "Test interactive Haskell examples")
    (description "The doctest program checks examples in source code comments.
It is modeled after doctest for Python, see
@uref{https://docs.python.org/library/doctest.html, the Doctest website}.")
    (license expat)))

(define-public ghc-control-monad-free
  (package
    (name "ghc-control-monad-free")
    (version "0.6.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/control-monad-free/control-monad-free-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1habgf7byffqf1rqjkzpihvdhclaafgqsqpfpwp3fgpj5ayk1j33"))))
    (build-system haskell-build-system)
    (home-page
      "http://github.com/pepeiborra/control-monad-free")
    (synopsis "Free monads and monad transformers")
    (description
      "This package provides datatypes to construct Free monads, Free monad transformers, and useful instances. In addition it provides the constructs to avoid quadratic complexity of left associative bind, as explained in: . * Janis Voigtlander, /Asymptotic Improvement of Computations over Free Monads, MPC'08/")
    (license public-domain)))

(define-public ghc-wizards
  (package
    (name "ghc-wizards")
    (version "1.0.3")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/wizards/wizards-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1clvbd1ckhvy29qrbmpkn7bya7300fq6znnps23nn3nxyrxhsr85"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-control-monad-free"
         ,ghc-control-monad-free)))
    (arguments
      `(#:cabal-revision
        ("1"
         "095qd17zrdhqmcvmslbyzfa5sh9glvvsnsvnlz31gzsmi8nnsgim")))
    (home-page
      "http://hackage.haskell.org/package/wizards")
    (synopsis
      "High level, generic library for interrogative user interfaces")
    (description
      "@wizards@ is a package designed for the quick and painless development of /interrogative/ programs, which revolve around a \\\"dialogue\\\" with the user, who is asked a series of questions in a sequence much like an installation wizard. . Everything from interactive system scripts, to installation wizards, to full-blown shells can be implemented with the support of @wizards@. . It is developed transparently on top of a free monad, which separates out the semantics of the program from any particular interface. A variety of backends exist, including console-based \"System.Console.Wizard.Haskeline\" and \"System.Console.Wizard.BasicIO\", and the pure \"System.Console.Wizard.Pure\". It is also possible to write your own backends, or extend existing back-ends with new features. While both built-in IO backends operate on a console, there is no reason why @wizards@ cannot also be used for making GUI wizard interfaces. . . See the github page for examples on usage: . <http://www.github.com/liamoc/wizards> . For creating backends, the module \"System.Console.Wizard.Internal\" has a brief tutorial.")
    (license bsd-3)))

(define-public ghc-lucid
  (package
    (name "ghc-lucid")
    (version "2.9.12")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/lucid/lucid-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "156wniydd1hlb7rygbm95zln8ky8lai8rn2apkkv0rax9cdw6jrh"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-blaze-builder" ,ghc-blaze-builder)
        ("ghc-hashable" ,ghc-hashable)
        ("ghc-mmorph" ,ghc-mmorph)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)))
    (native-inputs
      `(("ghc-hunit" ,ghc-hunit)
        ("ghc-hspec" ,ghc-hspec)
        ("ghc-bifunctors" ,ghc-bifunctors)))
    (arguments
      `(#:cabal-revision
        ("1"
         "1f0whk5ncanxfjjanrf6rqyncig2xgc5mh2j0sqy3nrlyjr9aqq9")))
    (home-page "https://github.com/chrisdone/lucid")
    (synopsis
      "Clear to write, read and edit DSL for HTML")
    (description
      "Clear to write, read and edit DSL for HTML. . * Names are consistent, and do not conflict with base or are keywords (all have suffix @_@) . * Same combinator can be used for attributes and elements (e.g. 'style_') . * For more, read <https://chrisdone.com/posts/lucid the blog post> . See the \"Lucid\" module for more documentation.")
    (license bsd-3)))

(define-public ghc-uglymemo
  (package
    (name "ghc-uglymemo")
    (version "0.1.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/uglymemo/uglymemo-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0ixqg5d0ly1r18jbgaa89i6kjzgi6c5hanw1b1y8c5fbq14yz2gy"))))
    (build-system haskell-build-system)
    (home-page
      "http://hackage.haskell.org/package/uglymemo")
    (synopsis
      "A simple (but internally ugly) memoization function.")
    (description
      "A simple (but internally ugly) memoization function. . * New in 0.1.0.1: Make it exception safe.")
    (license public-domain)))

(define-public ghc-csv
  (package
    (name "ghc-csv")
    (version "0.1.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/csv/csv-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "00767ai09wm7f0yzmpqck3cpgxncpr9djnmmz5l17ajz69139x4c"))))
    (build-system haskell-build-system)
    (home-page
      "http://hackage.haskell.org/package/csv")
    (synopsis "CSV loader and dumper")
    (description
      "CSV loader and dumper . This library parses and dumps documents that are formatted according to RFC 4180, \\\"The common Format and MIME Type for Comma-Separated Values (CSV) Files\\\". This format is used, among many other things, as a lingua franca for spreadsheets, and for certain web services.")
    (license expat)))

(define-public ghc-tabular
  (package
    (name "ghc-tabular")
    (version "0.2.2.8")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/tabular/tabular-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0z936gh8n8i8qdkagyxwd9gqq13skd5fv013vdvwsibrxkm0czfb"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-csv" ,ghc-csv) ("ghc-html" ,ghc-html)))
    (home-page "https://github.com/bgamari/tabular")
    (synopsis
      "Two-dimensional data tables with rendering functions")
    (description
      "Tabular provides a Haskell representation of two-dimensional data tables, the kind that you might find in a spreadsheet or or a research report.  It also comes with some default rendering functions for turning those tables into ASCII art, simple text with an arbitrary delimiter, CSV, HTML or LaTeX. . Below is an example of the kind of output this library produces. The tabular package can group rows and columns, each group having one of three separators (no line, single line, double line) between its members. . >     || memtest 1 | memtest 2 ||  time test  | time test 2 > ====++===========+===========++=============+============ > A 1 ||       hog |  terrible ||        slow |      slower > A 2 ||       pig |   not bad ||        fast |     slowest > ----++-----------+-----------++-------------+------------ > B 1 ||      good |     awful || intolerable |    bearable > B 2 ||    better | no chance ||    crawling |     amazing > B 3 ||       meh |   well... ||  worst ever |          ok")
    (license bsd-3)))

(define-public ghc-megaparsec
  (package
    (name "ghc-megaparsec")
    (version "9.0.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/megaparsec/megaparsec-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1x10f2b14ww306am9w06s23va26ab3vwdh0jk67ql6ybigxh0asi"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-case-insensitive" ,ghc-case-insensitive)
        ("ghc-parser-combinators"
         ,ghc-parser-combinators)
        ("ghc-scientific" ,ghc-scientific)))
    (home-page
      "https://github.com/mrkkrp/megaparsec")
    (synopsis "Monadic parser combinators")
    (description
      "This is an industrial-strength monadic parser combinator library. Megaparsec is a feature-rich package that tries to find a nice balance between speed, flexibility, and quality of parse errors.")
    (license bsd-2)))

(define-public ghc-hspec-megaparsec
  (package
    (name "ghc-hspec-megaparsec")
    (version "2.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/hspec-megaparsec/hspec-megaparsec-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0hyf06gzzqd6sqd76crwxycwgx804sd39z7i0c2vmv1qgsxv82gn"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-hspec-expectations"
         ,ghc-hspec-expectations)
        ("ghc-megaparsec" ,ghc-megaparsec)))
    (native-inputs `(("ghc-hspec" ,ghc-hspec)))
    (home-page
      "https://github.com/mrkkrp/hspec-megaparsec")
    (synopsis
      "Utility functions for testing Megaparsec parsers with Hspec")
    (description
      "Utility functions for testing Megaparsec parsers with Hspec.")
    (license bsd-3)))

(define-public ghc-cassava-megaparsec
  (package
    (name "ghc-cassava-megaparsec")
    (version "2.0.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/cassava-megaparsec/cassava-megaparsec-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "03x1462agrfdagklp8c89b8p4z2hd8nbf6d3895sz770zjkawda7"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-cassava" ,ghc-cassava)
        ("ghc-megaparsec" ,ghc-megaparsec)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-vector" ,ghc-vector)))
    (native-inputs
      `(("ghc-hspec" ,ghc-hspec)
        ("ghc-hspec-megaparsec" ,ghc-hspec-megaparsec)))
    (home-page
      "https://github.com/stackbuilders/cassava-megaparsec")
    (synopsis
      "Megaparsec parser of CSV files that plays nicely with Cassava")
    (description
      "Megaparsec parser of CSV files that plays nicely with Cassava.")
    (license expat)))

(define-public ghc-only
  (package
    (name "ghc-only")
    (version "0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/Only/Only-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0rdj3a629fk2vp121jq8mf2smkblrz5w3cxhlsyx6my2x29s2ymb"))))
    (build-system haskell-build-system)
    (arguments
      `(#:cabal-revision
        ("1"
         "1ahk7p34kmh041mz7lyc10nhcxgv2i4z8nvzxvqm2x34gslmsbzr")))
    (home-page
      "http://hackage.haskell.org/package/Only")
    (synopsis
      "The 1-tuple type or single-value \"collection\"")
    (description
      "This package provides a canonical anonymous 1-tuple type missing from Haskell for attaching typeclass instances. . NOTE: There is also the </package/OneTuple OneTuple package> which by using a boxed @data@-type provides a 1-tuple type which has laziness properties which are more faithful to the ones of Haskell's native tuples; whereas the primary purpose of 'Only' is to provide the traditionally so named type-wrapper for attaching typeclass instances.")
    (license bsd-3)))

(define-public ghc-text-short
  (package
    (name "ghc-text-short")
    (version "0.1.3")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/text-short/text-short-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0xyrxlb602z8bc9sr2y1fag0x56a20yj5qrkvy7iwc6hnznrynxz"))))
    (build-system haskell-build-system)
    (inputs `(("ghc-hashable" ,ghc-hashable)))
    (native-inputs
      `(("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)
        ("ghc-quickcheck-instances"
         ,ghc-quickcheck-instances)))
    (arguments
      `(#:cabal-revision
        ("2"
         "17cb7p0qywf2dsrq3g8qb3ssknd9wl5k0nc2pxz9gc3l8rxpkw51")))
    (home-page
      "http://hackage.haskell.org/package/text-short")
    (synopsis
      "Memory-efficient representation of Unicode text strings")
    (description
      "This package provides the 'ShortText' type which is suitable for keeping many short strings in memory. This is similiar to how 'ShortByteString' relates to 'ByteString'. . The main difference between 'Text' and 'ShortText' is that 'ShortText' uses UTF-8 instead of UTF-16 internally and also doesn't support zero-copy slicing (thereby saving 2 words). Consequently, the memory footprint of a (boxed) 'ShortText' value is 4 words (2 words when unboxed) plus the length of the UTF-8 encoded payload.")
    (license bsd-3)))

(define-public ghc-cassava
  (package
    (name "ghc-cassava")
    (version "0.5.2.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/cassava/cassava-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "01h1zrdqb313cjd4rqm1107azzx4czqi018c2djf66a5i7ajl3dk"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-attoparsec" ,ghc-attoparsec)
        ("ghc-hashable" ,ghc-hashable)
        ("ghc-scientific" ,ghc-scientific)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-vector" ,ghc-vector)
        ("ghc-only" ,ghc-only)
        ("ghc-text-short" ,ghc-text-short)
        ("ghc-bytestring-builder"
         ,ghc-bytestring-builder)))
    (native-inputs
      `(("ghc-hunit" ,ghc-hunit)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-quickcheck-instances"
         ,ghc-quickcheck-instances)
        ("ghc-test-framework" ,ghc-test-framework)
        ("ghc-test-framework-hunit"
         ,ghc-test-framework-hunit)
        ("ghc-test-framework-quickcheck2"
         ,ghc-test-framework-quickcheck2)))
    (arguments
      `(#:cabal-revision
        ("1"
         "1ph8rf91z4nf1ryrh9s4gd1kq98jlgk2manwddkpch8k0n9xvfk4") 
        #:configure-flags '("--flags=-bytestring--lt-0_10_4")))
    (home-page "https://github.com/hvr/cassava")
    (synopsis "A CSV parsing and encoding library")
    (description
      "@cassava@ is a library for parsing and encoding [RFC 4180](https://tools.ietf.org/html/rfc4180)
compliant [comma-separated values (CSV)](https://en.wikipedia.org/wiki/Comma-separated_values) data,
which is a textual line-oriented format commonly used for exchanging tabular data.
.
@cassava@'s API includes support for
.
- Index-based record-conversion
- Name-based record-conversion
- Typeclass directed conversion of fields and records
- Built-in field-conversion instances for standard types
- Customizable record-conversion instance derivation via GHC generics
- Low-level [bytestring](https://hackage.haskell.org/package/bytestring) builders (see \"Data.Csv.Builder\")
- Incremental decoding and encoding API (see \"Data.Csv.Incremental\")
- Streaming API for constant-space decoding (see \"Data.Csv.Streaming\")
.
Moreover, this library is designed to be easy to use; for instance, here's a
very simple example of encoding CSV data:
.
>>> Data.Csv.encode [(\"John\",27),(\"Jane\",28)]
\"John,27\\r\
Jane,28\\r\
\"
.
Please refer to the documentation in \"Data.Csv\" and the included [README](#readme) for more usage examples.")
    (license bsd-3)))

(define-public ghc-hledger-lib
  (package
    (name "ghc-hledger-lib")
    (version "1.19.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/hledger-lib/hledger-lib-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0py11011r358nmnvwwkc8mlx6mpy36jm8sqlr4i8ihx3x0zjdgya"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-decimal" ,ghc-decimal)
        ("ghc-glob" ,ghc-glob)
        ("ghc-aeson" ,ghc-aeson)
        ("ghc-aeson-pretty" ,ghc-aeson-pretty)
        ("ghc-ansi-terminal" ,ghc-ansi-terminal)
        ("ghc-base-compat-batteries"
         ,ghc-base-compat-batteries)
        ("ghc-blaze-markup" ,ghc-blaze-markup)
        ("ghc-call-stack" ,ghc-call-stack)
        ("ghc-cassava" ,ghc-cassava)
        ("ghc-cassava-megaparsec"
         ,ghc-cassava-megaparsec)
        ("ghc-cmdargs" ,ghc-cmdargs)
        ("ghc-data-default" ,ghc-data-default)
        ("ghc-extra" ,ghc-extra)
        ("ghc-fgl" ,ghc-fgl)
        ("ghc-file-embed" ,ghc-file-embed)
        ("ghc-hashtables" ,ghc-hashtables)
        ("ghc-megaparsec" ,ghc-megaparsec)
        ("ghc-old-time" ,ghc-old-time)
        ("ghc-parser-combinators"
         ,ghc-parser-combinators)
        ("ghc-pretty-show" ,ghc-pretty-show)
        ("ghc-regex-tdfa" ,ghc-regex-tdfa)
        ("ghc-safe" ,ghc-safe)
        ("ghc-split" ,ghc-split)
        ("ghc-tabular" ,ghc-tabular)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)
        ("ghc-timeit" ,ghc-timeit)
        ("ghc-uglymemo" ,ghc-uglymemo)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-utf8-string" ,ghc-utf8-string)))
    (native-inputs `(("ghc-doctest" ,ghc-doctest)))
    (home-page "http://hledger.org")
    (synopsis
      "A reusable library providing the core functionality of hledger")
    (description
      "A reusable library containing hledger's core functionality. This is used by most hledger* packages so that they support the same common file formats, command line options, reports etc. . hledger is a robust, cross-platform set of tools for tracking money, time, or any other commodity, using double-entry accounting and a simple, editable file format, with command-line, terminal and web interfaces. It is a Haskell rewrite of Ledger, and one of the leading implementations of Plain Text Accounting. Read more at: <https://hledger.org>")
    (license gpl3)))

(define-public ghc-decimal
  (package
    (name "ghc-decimal")
    (version "0.5.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/Decimal/Decimal-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0k7kh05mr2f54w1lpgq1nln0h8k6s6h99dyp5jzsb9cfbb3aap2p"))))
    (build-system haskell-build-system)
    (native-inputs
      `(("ghc-hunit" ,ghc-hunit)
        ("ghc-quickcheck" ,ghc-quickcheck)
        ("ghc-test-framework" ,ghc-test-framework)
        ("ghc-test-framework-quickcheck2"
         ,ghc-test-framework-quickcheck2)
        ("ghc-test-framework-hunit"
         ,ghc-test-framework-hunit)))
    (home-page
      "https://github.com/PaulJohnson/Haskell-Decimal")
    (synopsis
      "Decimal numbers with variable precision")
    (description
      "A decimal number has an integer mantissa and a negative exponent.  The exponent can be interpreted as the number of decimal places in the value.")
    (license bsd-3)))

(define-public ghc-hledger
  (package
    (name "ghc-hledger")
    (version "1.19.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/hledger/hledger-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0wfsyf2q1kf90mj3lxs0m5ghj153axmpkc8xfy12vkz5imnyphfm"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-decimal" ,ghc-decimal)
        ("ghc-diff" ,ghc-diff)
        ("ghc-aeson" ,ghc-aeson)
        ("ghc-ansi-terminal" ,ghc-ansi-terminal)
        ("ghc-base-compat-batteries"
         ,ghc-base-compat-batteries)
        ("ghc-cmdargs" ,ghc-cmdargs)
        ("ghc-data-default" ,ghc-data-default)
        ("ghc-extra" ,ghc-extra)
        ("ghc-hashable" ,ghc-hashable)
        ("ghc-hledger-lib" ,ghc-hledger-lib)
        ("ghc-lucid" ,ghc-lucid)
        ("ghc-math-functions" ,ghc-math-functions)
        ("ghc-megaparsec" ,ghc-megaparsec)
        ("ghc-old-time" ,ghc-old-time)
        ("ghc-pretty-show" ,ghc-pretty-show)
        ("ghc-regex-tdfa" ,ghc-regex-tdfa)
        ("ghc-safe" ,ghc-safe)
        ("ghc-shakespeare" ,ghc-shakespeare)
        ("ghc-split" ,ghc-split)
        ("ghc-tabular" ,ghc-tabular)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-temporary" ,ghc-temporary)
        ("ghc-timeit" ,ghc-timeit)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-utf8-string" ,ghc-utf8-string)
        ("ghc-utility-ht" ,ghc-utility-ht)
        ("ghc-wizards" ,ghc-wizards)))
    (home-page "http://hledger.org")
    (synopsis
      "Command-line interface for the hledger accounting system")
    (description
      "The command-line interface for the hledger accounting system. Its basic function is to read a plain text file describing financial transactions and produce useful reports. . hledger is a robust, cross-platform set of tools for tracking money, time, or any other commodity, using double-entry accounting and a simple, editable file format, with command-line, terminal and web interfaces. It is a Haskell rewrite of Ledger, and one of the leading implementations of Plain Text Accounting. Read more at: <https://hledger.org>")
    (license gpl3)))

(define-public ghc-hledger
    (package
      (name "ghc-hledger")
      (version "1.19.1")
      (source
        (origin
          (method url-fetch)
          (uri (string-append
                 "https://hackage.haskell.org/package/hledger/hledger-"
                 version
                 ".tar.gz"))
          (sha256
            (base32
              "0wfsyf2q1kf90mj3lxs0m5ghj153axmpkc8xfy12vkz5imnyphfm"))))
      (build-system haskell-build-system)
      (inputs
        `(("ghc-decimal" ,ghc-decimal)
          ("ghc-diff" ,ghc-diff)
          ("ghc-aeson" ,ghc-aeson)
          ("ghc-ansi-terminal" ,ghc-ansi-terminal)
          ("ghc-base-compat-batteries"
           ,ghc-base-compat-batteries)
          ("ghc-cmdargs" ,ghc-cmdargs)
          ("ghc-data-default" ,ghc-data-default)
          ("ghc-extra" ,ghc-extra)
          ("ghc-hashable" ,ghc-hashable)
          ("ghc-hledger-lib" ,ghc-hledger-lib)
          ("ghc-lucid" ,ghc-lucid)
          ("ghc-math-functions" ,ghc-math-functions)
          ("ghc-megaparsec" ,ghc-megaparsec)
          ("ghc-old-time" ,ghc-old-time)
          ("ghc-pretty-show" ,ghc-pretty-show)
          ("ghc-regex-tdfa" ,ghc-regex-tdfa)
          ("ghc-safe" ,ghc-safe)
          ("ghc-shakespeare" ,ghc-shakespeare)
          ("ghc-split" ,ghc-split)
          ("ghc-tabular" ,ghc-tabular)
          ("ghc-tasty" ,ghc-tasty)
          ("ghc-temporary" ,ghc-temporary)
          ("ghc-timeit" ,ghc-timeit)
          ("ghc-unordered-containers"
           ,ghc-unordered-containers)
          ("ghc-utf8-string" ,ghc-utf8-string)
          ("ghc-utility-ht" ,ghc-utility-ht)
          ("ghc-wizards" ,ghc-wizards)))
      (home-page "http://hledger.org")
      (synopsis
        "Command-line interface for the hledger accounting system")
      (description
        "The command-line interface for the hledger accounting system. Its basic function is to read a plain text file describing financial transactions and produce useful reports. . hledger is a robust, cross-platform set of tools for tracking money, time, or any other commodity, using double-entry accounting and a simple, editable file format, with command-line, terminal and web interfaces. It is a Haskell rewrite of Ledger, and one of the leading implementations of Plain Text Accounting. Read more at: <https://hledger.org>")
      (license gpl3)))

(define-public ghc-yesod-test
  (package
    (name "ghc-yesod-test")
    (version "1.6.8")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/yesod-test/yesod-test-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1c8xana3lf79db17mc74q88ygdskhyhvrv325fpwdw00fcwc0fn6"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-hunit" ,ghc-hunit)
        ("ghc-attoparsec" ,ghc-attoparsec)
        ("ghc-blaze-builder" ,ghc-blaze-builder)
        ("ghc-blaze-html" ,ghc-blaze-html)
        ("ghc-case-insensitive" ,ghc-case-insensitive)
        ("ghc-conduit" ,ghc-conduit)
        ("ghc-cookie" ,ghc-cookie)
        ("ghc-hspec-core" ,ghc-hspec-core)
        ("ghc-html-conduit" ,ghc-html-conduit)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-network" ,ghc-network)
        ("ghc-memory" ,ghc-memory)
        ("ghc-pretty-show" ,ghc-pretty-show)
        ("ghc-semigroups" ,ghc-semigroups)
        ("ghc-wai" ,ghc-wai)
        ("ghc-wai-extra" ,ghc-wai-extra)
        ("ghc-xml-conduit" ,ghc-xml-conduit)
        ("ghc-xml-types" ,ghc-xml-types)
        ("ghc-yesod-core" ,ghc-yesod-core)))
    (native-inputs
      `(("ghc-hspec" ,ghc-hspec)
        ("ghc-yesod-form" ,ghc-yesod-form)
        ("ghc-unliftio" ,ghc-unliftio)))
    (home-page "http://www.yesodweb.com")
    (synopsis
      "integration testing for WAI/Yesod Applications")
    (description
      "API docs and the README are available at <http://www.stackage.org/package/yesod-test>")
    (license expat)))

(define-public ghc-wai-app-static
  (package
    (name "ghc-wai-app-static")
    (version "3.1.7.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/wai-app-static/wai-app-static-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "138gd5482psq0wbm8s1az672lksi7vbavq6ayiyjkliivf6xpry8"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-wai" ,ghc-wai)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-unix-compat" ,ghc-unix-compat)
        ("ghc-old-locale" ,ghc-old-locale)
        ("ghc-file-embed" ,ghc-file-embed)
        ("ghc-cryptonite" ,ghc-cryptonite)
        ("ghc-memory" ,ghc-memory)
        ("ghc-http-date" ,ghc-http-date)
        ("ghc-blaze-html" ,ghc-blaze-html)
        ("ghc-blaze-markup" ,ghc-blaze-markup)
        ("ghc-mime-types" ,ghc-mime-types)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-zlib" ,ghc-zlib)
        ("ghc-wai-extra" ,ghc-wai-extra)
        ("ghc-optparse-applicative"
         ,ghc-optparse-applicative)
        ("ghc-warp" ,ghc-warp)))
    (native-inputs
      `(("ghc-hspec" ,ghc-hspec)
        ("ghc-network" ,ghc-network)
        ("ghc-temporary" ,ghc-temporary)
        ("ghc-mockery" ,ghc-mockery)))
    (arguments
      `(#:cabal-revision
        ("1"
         "1q7zwjasysgbp9rdp75535igd7s6mhi2bnl4pzsn6vbyfw3qnsxd")))
    (home-page
      "http://www.yesodweb.com/book/web-application-interface")
    (synopsis "WAI application for static serving")
    (description
      "API docs and the README are available at <http://www.stackage.org/package/wai-app-static>.")
    (license expat)))

(define-public ghc-cryptonite-conduit
  (package
    (name "ghc-cryptonite-conduit")
    (version "0.2.2")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/cryptonite-conduit/cryptonite-conduit-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1bldcmda4xh52mw1wfrjljv8crhw3al7v7kv1j0vidvr7ymnjpbh"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-conduit" ,ghc-conduit)
        ("ghc-conduit-extra" ,ghc-conduit-extra)
        ("ghc-cryptonite" ,ghc-cryptonite)
        ("ghc-exceptions" ,ghc-exceptions)
        ("ghc-memory" ,ghc-memory)
        ("ghc-resourcet" ,ghc-resourcet)))
    (native-inputs
      `(("ghc-conduit-combinators"
         ,ghc-conduit-combinators)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)
        ("ghc-tasty-quickcheck" ,ghc-tasty-quickcheck)))
    (arguments
      `(#:cabal-revision
        ("1"
         "1hh2nzfz4qpxgivfilgk4ll416lph8b2fdkzpzrmqfjglivydfmz")))
    (home-page
      "https://github.com/haskell-crypto/cryptonite-conduit")
    (synopsis "cryptonite conduit")
    (description
      "Conduit bridge for cryptonite . For now only provide a conduit version for hash and hmac, but with contribution, this could provide cipher conduits too, and probably other things.")
    (license bsd-3)))

(define-public ghc-yesod-static
  (package
    (name "ghc-yesod-static")
    (version "1.6.1.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/yesod-static/yesod-static-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "18f5hm9ncvkzl8bkn39cg841z0k5iqs5w45afsyk9y6k98pjd54p"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-async" ,ghc-async)
        ("ghc-attoparsec" ,ghc-attoparsec)
        ("ghc-base64-bytestring" ,ghc-base64-bytestring)
        ("ghc-blaze-builder" ,ghc-blaze-builder)
        ("ghc-conduit" ,ghc-conduit)
        ("ghc-cryptonite" ,ghc-cryptonite)
        ("ghc-cryptonite-conduit"
         ,ghc-cryptonite-conduit)
        ("ghc-css-text" ,ghc-css-text)
        ("ghc-data-default" ,ghc-data-default)
        ("ghc-file-embed" ,ghc-file-embed)
        ("ghc-hashable" ,ghc-hashable)
        ("ghc-hjsmin" ,ghc-hjsmin)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-memory" ,ghc-memory)
        ("ghc-mime-types" ,ghc-mime-types)
        ("ghc-unix-compat" ,ghc-unix-compat)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-wai" ,ghc-wai)
        ("ghc-wai-app-static" ,ghc-wai-app-static)
        ("ghc-yesod-core" ,ghc-yesod-core)))
    (native-inputs
      `(("ghc-hspec" ,ghc-hspec)
        ("ghc-yesod-test" ,ghc-yesod-test)
        ("ghc-wai-extra" ,ghc-wai-extra)
        ("ghc-hunit" ,ghc-hunit)
        ("ghc-rio" ,ghc-rio)))
    (home-page "http://www.yesodweb.com/")
    (synopsis
      "Static file serving subsite for Yesod Web Framework.")
    (description
      "API docs and the README are available at <http://www.stackage.org/package/yesod-static>")
    (license expat)))

(define-public ghc-wai-handler-launch
  (package
    (name "ghc-wai-handler-launch")
    (version "3.0.3.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/wai-handler-launch/wai-handler-launch-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1ifqgyc1ccig5angh5l1iq7vyms4lvi8wzvysg5dw82nml49n02m"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-wai" ,ghc-wai)
        ("ghc-warp" ,ghc-warp)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-streaming-commons" ,ghc-streaming-commons)
        ("ghc-async" ,ghc-async)))
    (home-page
      "http://hackage.haskell.org/package/wai-handler-launch")
    (synopsis
      "Launch a web app in the default browser.")
    (description
      "API docs and the README are available at <http://www.stackage.org/package/wai-handler-launch>.")
    (license expat)))

(define-public ghc-wai-cors
  (package
    (name "ghc-wai-cors")
    (version "0.2.7")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/wai-cors/wai-cors-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "10gv3jjlkcb13031frr818p56v2s0qf6dqjsfpwlhwdxdssvx5r5"))))
    (build-system haskell-build-system)
    (arguments `(#:tests? #f)) ; FIXME: Missing phantomjs.
    (inputs
      `(("ghc-attoparsec" ,ghc-attoparsec)
        ("ghc-base-unicode-symbols"
         ,ghc-base-unicode-symbols)
        ("ghc-case-insensitive" ,ghc-case-insensitive)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-wai" ,ghc-wai)))
    (native-inputs
      `(("ghc-network" ,ghc-network)
        ("ghc-wai-websockets" ,ghc-wai-websockets)
        ("ghc-warp" ,ghc-warp)
        ("ghc-websockets" ,ghc-websockets)
        ("ghc-tasty" ,ghc-tasty)
        ("ghc-tasty-hunit" ,ghc-tasty-hunit)
        ("ghc-wai-extra" ,ghc-wai-extra)
        ("ghc-wai-websockets" ,ghc-wai-websockets)
        ("ghc-warp" ,ghc-warp)
        ("ghc-websockets" ,ghc-websockets)))
    (home-page
      "https://github.com/larskuhtz/wai-cors")
    (synopsis "CORS for WAI")
    (description
      "This package provides an implemenation of Cross-Origin resource sharing (CORS) for <http://hackage.haskell.org/package/wai Wai> that aims to be compliant with <http://www.w3.org/TR/cors>.")
    (license expat)))

(define-public ghc-uglymemo
  (package
    (name "ghc-uglymemo")
    (version "0.1.0.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/uglymemo/uglymemo-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "0ixqg5d0ly1r18jbgaa89i6kjzgi6c5hanw1b1y8c5fbq14yz2gy"))))
    (build-system haskell-build-system)
    (home-page
      "http://hackage.haskell.org/package/uglymemo")
    (synopsis
      "A simple (but internally ugly) memoization function.")
    (description
      "A simple (but internally ugly) memoization function. . * New in 0.1.0.1: Make it exception safe.")
    (license public-domain)))

(define-public ghc-hjsmin
  (package
    (name "ghc-hjsmin")
    (version "0.2.0.4")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/hjsmin/hjsmin-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "1r2p5rjdjr25j3w4s57q5hxw2c3ymw12x7ms18yvglnq2ivr9fc1"))))
    (build-system haskell-build-system)
    (arguments `(#:tests? #f)) ; FIXME: Missing testing libraries.
    (inputs
      `(("ghc-language-javascript"
         ,ghc-language-javascript)
        ("ghc-optparse-applicative"
         ,ghc-optparse-applicative)))
    (native-inputs `(("ghc-extra" ,ghc-extra)))
    (home-page "http://github.com/erikd/hjsmin")
    (synopsis
      "Haskell implementation of a javascript minifier")
    (description
      "Reduces size of javascript files by stripping out extraneous whitespace and other syntactic elements, without changing the semantics.")
    (license bsd-3)))

(define-public ghc-hledger-web
  (package
    (name "ghc-hledger-web")
    (version "1.19.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append
               "https://hackage.haskell.org/package/hledger-web/hledger-web-"
               version
               ".tar.gz"))
        (sha256
          (base32
            "03wak0dgxhf7y2mc2az4xcypgz1z1lf65vn6kj98z063pmlwp1b0"))))
    (build-system haskell-build-system)
    (inputs
      `(("ghc-decimal" ,ghc-decimal)
        ("ghc-aeson" ,ghc-aeson)
        ("ghc-blaze-html" ,ghc-blaze-html)
        ("ghc-blaze-markup" ,ghc-blaze-markup)
        ("ghc-case-insensitive" ,ghc-case-insensitive)
        ("ghc-clientsession" ,ghc-clientsession)
        ("ghc-cmdargs" ,ghc-cmdargs)
        ("ghc-conduit" ,ghc-conduit)
        ("ghc-conduit-extra" ,ghc-conduit-extra)
        ("ghc-data-default" ,ghc-data-default)
        ("ghc-extra" ,ghc-extra)
        ("ghc-hjsmin" ,ghc-hjsmin)
        ("ghc-hledger" ,ghc-hledger)
        ("ghc-hledger-lib" ,ghc-hledger-lib)
        ("ghc-http-client" ,ghc-http-client)
        ("ghc-http-conduit" ,ghc-http-conduit)
        ("ghc-http-types" ,ghc-http-types)
        ("ghc-megaparsec" ,ghc-megaparsec)
        ("ghc-network" ,ghc-network)
        ("ghc-shakespeare" ,ghc-shakespeare)
        ("ghc-unix-compat" ,ghc-unix-compat)
        ("ghc-unordered-containers"
         ,ghc-unordered-containers)
        ("ghc-utf8-string" ,ghc-utf8-string)
        ("ghc-wai" ,ghc-wai)
        ("ghc-wai-cors" ,ghc-wai-cors)
        ("ghc-wai-extra" ,ghc-wai-extra)
        ("ghc-wai-handler-launch"
         ,ghc-wai-handler-launch)
        ("ghc-warp" ,ghc-warp)
        ("ghc-yaml" ,ghc-yaml)
        ("ghc-yesod" ,ghc-yesod)
        ("ghc-yesod-core@1.6.18.4" ,ghc-yesod-core)
        ("ghc-yesod-form" ,ghc-yesod-form)
        ("ghc-yesod-static" ,ghc-yesod-static)))
    (home-page "http://hledger.org")
    (synopsis
      "Web-based user interface for the hledger accounting system")
    (description
      "A simple web-based user interface for the hledger accounting system, providing a more modern UI than the command-line or terminal interfaces. It can be used as a local single-user UI, or as a multi-user UI for viewing/adding/editing on the web. . hledger is a robust, cross-platform set of tools for tracking money, time, or any other commodity, using double-entry accounting and a simple, editable file format, with command-line, terminal and web interfaces. It is a Haskell rewrite of Ledger, and one of the leading implementations of Plain Text Accounting. Read more at: <https://hledger.org>")
    (license gpl3)))
