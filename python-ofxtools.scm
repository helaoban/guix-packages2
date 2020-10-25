(use-modules (guix packages) (guix download)
             (guix build-system python)
             (guix git-download)
             (guix licenses)
             (gnu packages check))

(define-public python-ofxtools
  (package
    (name "python-ofxtools")
    (version "0.8.22")
    (source
      (origin
        (method git-fetch)
        ;; git-reference because tests are not included in pypi source tarball
        ;; https://issues.guix.gnu.org/issue/36755#2
        (uri (git-reference
             (url "https://github.com/csingley/ofxtools")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
          "1cl2hdbdpcci9f7ca5fa506qji7bfal7x4rmsjb0s01apxv28kkl"))))
    (build-system python-build-system)
    (arguments
      `(#:phases
        (modify-phases %standard-phases
         (replace 'check
           (lambda _
             (setenv "HOME" "/tmp")
             (invoke "nosetests" "-v"))))))
    (native-inputs
     `(("python-nose" ,python-nose)))
    (home-page
      "https://github.com/csingley/ofxtools")
    (synopsis
      "Library for working with Open Financial Exchange (OFX) data")
    (description
      "Library for working with Open Financial Exchange (OFX) data")
    (license expat)))
