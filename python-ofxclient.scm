(use-modules (guix packages) (guix download)
             (guix build-system python)
             (guix git-download)
             (guix licenses)
             (gnu packages check))

(define-public python-ofxtools
  (package
    (name "python-ofxclient")
    (version "2.0.4")
    (source
      (origin
        (method git-fetch)
        ;; git-reference because tests are not included in pypi source tarball
        ;; https://issues.guix.gnu.org/issue/36755#2
        (uri (git-reference
             (url "https://github.com/captin411/ofxclient")
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
      "https://github.com/captin411/ofxclient")
    (synopsis
      "OFX client for dowloading transactions from banks")
    (description
      "OFX client for dowloading transactions from banks")
    (license expat)))
